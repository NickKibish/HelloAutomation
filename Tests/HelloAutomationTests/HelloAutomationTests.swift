import XCTest
@testable import HelloAutomation

final class HelloAutomationTests: XCTestCase {
    func testExample() throws {
        let helloAutomation = HelloAutomation()
        XCTAssertEqual(helloAutomation.hello(), "Hello, Automation!")
    }
}
