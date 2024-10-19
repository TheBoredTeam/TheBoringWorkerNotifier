import XCTest
@testable import TheBoringWorkerNotifier

final class TheBoringWorkerNotifierTests: XCTestCase {
    var notifier: TheBoringWorkerNotifier!
    
    override func setUp() {
        super.setUp()
        notifier = TheBoringWorkerNotifier()
    }
    
    override func tearDown() {
        notifier = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(notifier)
    }
    
    func testPostNotification() {
        let expectation = XCTestExpectation(description: "Notification posted")
        
        notifier.setupObserver(notification: notifier.toggleMicNotification) { notification in
            XCTAssertEqual(notification.name.rawValue, "theboringteam.theboringworker.togglemic")
            XCTAssertEqual(notification.userInfo?["test"] as? String, "value")
            expectation.fulfill()
        }
        
        notifier.postNotification(name: "theboringteam.theboringworker.togglemic", userInfo: ["test": "value"])
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSetupObserver() {
        let expectation = XCTestExpectation(description: "Observer setup and notification received")
        
        notifier.setupObserver(notification: notifier.toggleHudReplacementNotification) { notification in
            XCTAssertEqual(notification.name.rawValue, "theboringteam.theboringworker.togglehudreplacement")
            expectation.fulfill()
        }
        
        notifier.postNotification(name: "theboringteam.theboringworker.togglehudreplacement", userInfo: nil)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testMultipleNotifications() {
        let expectation1 = XCTestExpectation(description: "First notification received")
        let expectation2 = XCTestExpectation(description: "Second notification received")
        
        notifier.setupObserver(notification: notifier.showClipboardNotification) { _ in
            expectation1.fulfill()
        }
        
        notifier.setupObserver(notification: notifier.sneakPeekNotification) { _ in
            expectation2.fulfill()
        }
        
        notifier.postNotification(name: "theboringteam.theboringnotch.showclipboard", userInfo: nil)
        notifier.postNotification(name: "theboringteam.workers.sneakPeek", userInfo: nil)
        
        wait(for: [expectation1, expectation2], timeout: 1.0)
    }
}
