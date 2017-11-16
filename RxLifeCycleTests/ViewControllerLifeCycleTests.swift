import XCTest
import RxLifeCycle

class ViewControllerLifeCycleTests: XCTestCase {

  var lifeCycle: ViewControllerLifeCycle!

  override func tearDown() {
    super.tearDown()

    lifeCycle = nil
  }

  // MARK: - Using ViewControllerLifeCycle manually

  func testViewWillAppear() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()
    lifeCycle = ViewControllerLifeCycle(viewController: viewController)

    _ = lifeCycle.viewWillAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  // MARK: - Using rx

  func testViewDidLoadUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rx.lifeCycle.viewDidLoad.subscribe(onNext: {
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }

  func testViewWillAppearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rx.lifeCycle.viewWillAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewDidAppearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rx.lifeCycle.viewDidAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewWillDisappearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rx.lifeCycle.viewWillDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillDisappear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewDidDisappearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rx.lifeCycle.viewDidDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidDisappear(true)
    wait(for: [expectation], timeout: 1)
  }
}
