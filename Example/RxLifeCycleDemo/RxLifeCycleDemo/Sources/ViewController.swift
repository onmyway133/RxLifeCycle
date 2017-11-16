import UIKit
import RxLifeCycle

class ViewController: UIViewController {

  // Need to keep this around
  let appLifeCycle = AppLifeCycle()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    _ = rx.lifeCycle.viewWillAppear.subscribe(onNext: {
      print("viewWillAppear")
    })

    _ = rx.lifeCycle.viewDidAppear.subscribe(onNext: {
      print("viewDidAppear")
    })

    _ = appLifeCycle.didEnterBackground.subscribe(onNext: {
      print("didEnterBackground")
    })

    _ = appLifeCycle.willEnterForeground.subscribe(onNext: {
      print("willEnterForeground")
    })
  }
}

