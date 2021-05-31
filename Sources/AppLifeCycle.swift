import UIKit
import RxSwift

/// Observe events of UIApplicationDelegate
public class AppLifeCycle {
  public var didBecomeActive: Observable<Void> {
    return observer.didBecomeActiveSubject
  }

  public var willResignActive: Observable<Void> {
    return observer.willResignActiveSubject
  }

  public var didEnterBackground: Observable<Void> {
    return observer.didEnterBackgroundSubject
  }

  public var willEnterForeground: Observable<Void> {
    return observer.willEnterForegroundSubject
  }

  private let observer: Observer

  public init() {
    observer = Observer()
  }
}

private extension AppLifeCycle {
  class Observer {
    let didBecomeActiveSubject = PublishSubject<Void>()
    let willResignActiveSubject = PublishSubject<Void>()
    let didEnterBackgroundSubject = PublishSubject<Void>()
    let willEnterForegroundSubject = PublishSubject<Void>()

    var observers: [AnyObject] = []

    init() {
      let center = NotificationCenter.default
      let application = UIApplication.shared
      let queue = OperationQueue.main

      observers.append(center.addObserver(
        forName: UIApplication.didBecomeActiveNotification,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.didBecomeActiveSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: UIApplication.willResignActiveNotification,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.willResignActiveSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: UIApplication.didEnterBackgroundNotification,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.didEnterBackgroundSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: UIApplication.willEnterForegroundNotification,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.willEnterForegroundSubject.onNext(())
        }
      ))
    }

    deinit {
      observers.forEach {
        NotificationCenter.default.removeObserver($0)
      }

      observers.removeAll()
    }
  }
}
