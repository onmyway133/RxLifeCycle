import UIKit
import RxSwift
import RxCocoa

fileprivate var viewControllerLifeCycleKey = "viewControllerLifeCycleKey"

public extension UIViewController {

  /// Use lifeCycle to observe view controller life cycle events
  public var rxLifeCycle: ViewControllerLifeCycle {
    if let lifeCycle = objc_getAssociatedObject(self, &viewControllerLifeCycleKey) as? ViewControllerLifeCycle {
      return lifeCycle
    }

    let lifeCycle = ViewControllerLifeCycle(viewController: self)

    objc_setAssociatedObject(
      self,
      viewControllerLifeCycleKey,
      lifeCycle,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )

    return lifeCycle
  }
}
