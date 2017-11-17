import UIKit
import RxLifeCycle

class ViewController: UIViewController {

  // Need to keep this around
  let appLifeCycle = AppLifeCycle()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    _ = lifeCycle.viewWillAppear.subscribe(onNext: {
      print("viewWillAppear")
    })

    _ = lifeCycle.viewDidAppear.subscribe(onNext: {
      print("viewDidAppear")
    })

    _ = UIApplication.shared.lifeCycle.didEnterBackground.subscribe(onNext: {
      print("didEnterBackground")
    })

    _ = appLifeCycle.didEnterBackground.subscribe(onNext: {
      print("didEnterBackground")
    })

    _ = appLifeCycle.willEnterForeground.subscribe(onNext: {
      print("willEnterForeground")
    })
  }
}

