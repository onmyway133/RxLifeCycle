import UIKit
import RxLifeCycle

class ViewController: UIViewController {

  // Need to keep this around
  let appLifeCycle = AppLifeCycle()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    // present button
    do {
      let button = UIButton()
      button.setTitleColor(.black, for: .normal)
      button.setTitle("Present", for: .normal)
      button.addTarget(self, action: #selector(presentSomething), for: .touchUpInside)
      view.addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    do {
      let button = UIButton()
      button.setTitleColor(.black, for: .normal)
      button.setTitle("Push", for: .normal)
      button.addTarget(self, action: #selector(pushSomething), for: .touchUpInside)
      view.addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
    }

    // push button

    // observe life cycle

    _ = rxLifeCycle.viewWillAppear.subscribe(onNext: {
      print("viewWillAppear")
    })

    _ = rxLifeCycle.viewDidAppear.subscribe(onNext: {
      print("viewDidAppear")
    })

    _ = UIApplication.shared.rxLifeCycle.didEnterBackground.subscribe(onNext: {
      print("didEnterBackground")
    })

    _ = appLifeCycle.didEnterBackground.subscribe(onNext: {
      print("didEnterBackground")
    })

    _ = appLifeCycle.willEnterForeground.subscribe(onNext: {
      print("willEnterForeground")
    })
  }

  // MARK: - Action

  @objc func presentSomething() {
    let childVC = ChildController()
    childVC.view.backgroundColor = .white

    _ = childVC.rxLifeCycle.viewWillAppear.subscribe(onNext: {
      print("childVC viewWillAppear")
    })

    _ = childVC.rxLifeCycle.viewDidAppear.subscribe(onNext: {
      print("childVC viewDidAppear")
    })

    _ = childVC.rxLifeCycle.viewWillDisappear.subscribe(onNext: {
      print("childVC viewWillDisappear")
    })

    _ = childVC.rxLifeCycle.viewDidDisappear.subscribe(onNext: {
      print("childVC viewDidDisappear")
    })

    present(childVC, animated: true, completion: nil)
  }

  @objc func pushSomething() {
    let childVC = ChildController()
    childVC.view.backgroundColor = .white

    _ = childVC.rxLifeCycle.viewWillAppear.subscribe(onNext: {
      print("childVC viewWillAppear")
    })

    _ = childVC.rxLifeCycle.viewDidAppear.subscribe(onNext: {
      print("childVC viewDidAppear")
    })

    _ = childVC.rxLifeCycle.viewWillDisappear.subscribe(onNext: {
      print("childVC viewWillDisappear")
    })

    _ = childVC.rxLifeCycle.viewDidDisappear.subscribe(onNext: {
      print("childVC viewDidDisappear")
    })

    navigationController?.pushViewController(childVC, animated: true)
  }
}

