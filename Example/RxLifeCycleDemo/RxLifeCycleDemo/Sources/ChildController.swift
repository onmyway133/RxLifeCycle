import UIKit

class ChildController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // button
    let button = UIButton()
    button.setTitleColor(.black, for: .normal)
    button.setTitle("Dismiss", for: .normal)
    button.addTarget(self, action: #selector(doSomething), for: .touchUpInside)
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  @objc func doSomething() {
    dismiss(animated: true, completion: nil)
  }
}
