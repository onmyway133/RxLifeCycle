import XCTest
import RxLifeCycle

class ViewControllerLifeCycleTests: XCTestCase {
  func testViewDidLoad() {
    let viewController = UIViewController()
    let expectation = self.expectation(description: #function)
    _ = viewController.rx.lifeCycle.viewDidLoad.subscribe(onNext: {
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }

  func testViewWillAppear() {
    let viewController = UIViewController()
    let expectation = self.expectation(description: #function)
    _ = viewController.rx.lifeCycle.viewWillAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewDidAppear() {
    let viewController = UIViewController()
    let expectation = self.expectation(description: #function)
    _ = viewController.rx.lifeCycle.viewDidAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewWillDisappear() {
    let viewController = UIViewController()
    let expectation = self.expectation(description: #function)
    _ = viewController.rx.lifeCycle.viewWillDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillDisappear(true)
    wait(for: [expectation], timeout: 1)
  }

  func testViewDidDisappear() {
    let viewController = UIViewController()
    let expectation = self.expectation(description: #function)
    _ = viewController.rx.lifeCycle.viewDidDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidDisappear(true)
    wait(for: [expectation], timeout: 1)
  }
}
