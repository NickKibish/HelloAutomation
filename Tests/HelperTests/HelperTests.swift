import XCTest 
@testable import Helper

final class HelperTests: XCTestCase {
    func testExample() throws {
        let helper = Helper()
        let date = Date(timeIntervalSince1970: 1634130000)
        XCTAssertEqual(helper.now(date), "2021-10-13 15:00:00")
    }
}