import XCTest
import RxLifeCycle

class AppLifeCycleTests: XCTestCase {
  var lifeCycle: AppLifeCycle!

  override func setUp() {
    super.setUp()

    lifeCycle = AppLifeCycle()
  }

  override func tearDown() {
    super.tearDown()

    lifeCycle = nil
  }

  // MARK: - Using AppLifeCycle manually

  func testDidBecomeActive() {
    let expectation = self.expectation(description: #function)

    _ = lifeCycle.didBecomeActive.subscribe(onNext: {
      expectation.fulfill()
    })

    NotificationCenter.default.post(
      name: Notification.Name.UIApplicationDidBecomeActive,
      object: UIApplication.shared
    )

    wait(for: [expectation], timeout: 1)
  }

  func testWillResignActive() {
    let expectation = self.expectation(description: #function)

    _ = lifeCycle.willResignActive.subscribe(onNext: {
      expectation.fulfill()
    })

    NotificationCenter.default.post(
      name: Notification.Name.UIApplicationWillResignActive,
      object: UIApplication.shared
    )

    wait(for: [expectation], timeout: 1)
  }

  func testDidEnterBackground() {
    let expectation = self.expectation(description: #function)

    _ = lifeCycle.didEnterBackground.subscribe(onNext: {
      expectation.fulfill()
    })

    NotificationCenter.default.post(
      name: Notification.Name.UIApplicationDidEnterBackground,
      object: UIApplication.shared
    )

    wait(for: [expectation], timeout: 1)
  }

  func testWillEnterForeground() {
    let expectation = self.expectation(description: #function)

    _ = lifeCycle.willEnterForeground.subscribe(onNext: {
      expectation.fulfill()
    })

    NotificationCenter.default.post(
      name: Notification.Name.UIApplicationWillEnterForeground,
      object: UIApplication.shared
    )

    wait(for: [expectation], timeout: 1)
  }

  // MARK: - Using rx

  func testDidBecomeActiveUsingRx() {
    let expectation = self.expectation(description: #function)

    _ = UIApplication.shared.rxLifeCycle.didBecomeActive.subscribe(onNext: {
      expectation.fulfill()
    })

    NotificationCenter.default.post(
      name: Notification.Name.UIApplicationDidBecomeActive,
      object: UIApplication.shared
    )

    wait(for: [expectation], timeout: 1)
  }
}
