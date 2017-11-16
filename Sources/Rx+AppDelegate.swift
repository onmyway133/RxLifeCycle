import UIKit
import RxSwift
import RxCocoa

fileprivate var appDelegateLifeCycleKey = "appDelegateLifeCycleKey"

/// Generic extension does not seem to work for protocol
public extension Reactive where Base: UIApplicationDelegate {
  public var lifeCycle: AppDelegateLifeCycle {
    if let lifeCycle = objc_getAssociatedObject(self, &appDelegateLifeCycleKey) as? AppDelegateLifeCycle {
      return lifeCycle
    }

    let lifeCycle = AppDelegateLifeCycle()

    objc_setAssociatedObject(
      self,
      appDelegateLifeCycleKey,
      lifeCycle,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )

    return lifeCycle
  }
}
