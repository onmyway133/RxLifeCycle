import XCTest
import RxLifeCycle

class ViewControllerLifeCycleTests: XCTestCase {

  var lifeCycle: ViewControllerLifeCycle!

  override func tearDown() {
    super.tearDown()

    lifeCycle = nil
  }

  // MARK: - Using ViewControllerLifeCycle manually

  func _testViewWillAppear() {
    let expectation = self.expectation(description: #function)
    let viewController = UIApplication.shared.delegate!.window!!.rootViewController!
    lifeCycle = ViewControllerLifeCycle(viewController: viewController)

    _ = lifeCycle.viewWillAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  // MARK: - Using rx

  func _testViewDidLoadUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rxLifeCycle.viewDidLoad.subscribe(onNext: {
      expectation.fulfill()
    })

    wait(for: [expectation], timeout: 1)
  }

  func _testViewWillAppearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rxLifeCycle.viewWillAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func _testViewDidAppearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rxLifeCycle.viewDidAppear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidAppear(true)
    wait(for: [expectation], timeout: 1)
  }

  func _testViewWillDisappearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rxLifeCycle.viewWillDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewWillDisappear(true)
    wait(for: [expectation], timeout: 1)
  }

  func _testViewDidDisappearUsingRx() {
    let expectation = self.expectation(description: #function)
    let viewController = UIViewController()

    _ = viewController.rxLifeCycle.viewDidDisappear.subscribe(onNext: {
      expectation.fulfill()
    })

    viewController.viewDidDisappear(true)
    wait(for: [expectation], timeout: 1)
  }
}
