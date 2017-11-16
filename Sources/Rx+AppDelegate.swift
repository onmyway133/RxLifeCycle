import UIKit
import RxSwift
import RxCocoa

fileprivate var appLifeCycleKey = "appLifeCycleKey"

/// Generic extension does not seem to work for protocol
public extension Reactive where Base: UIApplicationDelegate {
  public var lifeCycle: AppLifeCycle {
    if let lifeCycle = objc_getAssociatedObject(self, &appLifeCycleKey) as? AppLifeCycle {
      return lifeCycle
    }

    let lifeCycle = AppLifeCycle()

    objc_setAssociatedObject(
      self,
      appLifeCycleKey,
      lifeCycle,
      .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    )

    return lifeCycle
  }
}
