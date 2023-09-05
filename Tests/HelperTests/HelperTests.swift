import XCTest 
@testable import Helper

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
}