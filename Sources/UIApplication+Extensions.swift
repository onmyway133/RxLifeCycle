import UIKit
import RxSwift
import RxCocoa

fileprivate var appLifeCycleKey = "appLifeCycleKey"

public extension UIApplication {

  /// Use lifeCycle to observe many events related to UIApplicationDelegate
  public var rxLifeCycle: AppLifeCycle {
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
