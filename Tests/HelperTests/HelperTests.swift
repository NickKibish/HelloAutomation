import XCTest 
@testable import Helper

#if os(Linux)

extension XCTestCase {
    /// Wait on an array of expectations for up to the specified timeout, and optionally specify whether they
    /// must be fulfilled in the given order. May return early based on fulfillment of the waited on expectations.
    ///
    /// - Parameter expectations: The expectations to wait on.
    /// - Parameter timeout: The maximum total time duration to wait on all expectations.
    /// - Parameter enforceOrder: Specifies whether the expectations must be fulfilled in the order
    ///   they are specified in the `expectations` Array. Default is false.
    /// - Parameter file: The file name to use in the error message if
    ///   expectations are not fulfilled before the given timeout. Default is the file
    ///   containing the call to this method. It is rare to provide this
    ///   parameter when calling this method.
    /// - Parameter line: The line number to use in the error message if the
    ///   expectations are not fulfilled before the given timeout. Default is the line
    ///   number of the call to this method in the calling file. It is rare to
    ///   provide this parameter when calling this method.
    ///
    /// - SeeAlso: XCTWaiter
    func fulfillment(of expectations: [XCTestExpectation], timeout: TimeInterval, enforceOrder: Bool = false) async {
        return await withCheckedContinuation { continuation in
            // This function operates by blocking a background thread instead of one owned by libdispatch or by the
            // Swift runtime (as used by Swift concurrency.) To ensure we use a thread owned by neither subsystem, use
            // Foundation's Thread.detachNewThread(_:).
            Thread.detachNewThread { [self] in
                wait(for: expectations, timeout: timeout, enforceOrder: enforceOrder)
                continuation.resume()
            }
        }
    }
}
#endif

final class HelperTests: XCTestCase {
    func testExample() throws {
        let helper = Helper()

        let dateComponents = DateComponents(
            calendar: Calendar.current,
            timeZone: TimeZone.current,
            year: 2021,
            month: 10,
            day: 13,
            hour: 15,
            minute: 0,
            second: 0
        )

        let date = dateComponents.date!
        XCTAssertEqual(helper.now(date), "2021-10-13 15:00:00")
    }

    func testPingPong() async throws {
        let helper = Helper()
        let expectation = expectation(description: "ping")
        Task {
            let pong = await helper.ping()
            XCTAssertEqual(pong, "pong")
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 2)
    }
}
