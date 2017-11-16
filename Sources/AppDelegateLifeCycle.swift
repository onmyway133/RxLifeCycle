import UIKit
import RxSwift

public class AppDelegateLifeCycle {
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

private extension AppDelegateLifeCycle {
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
        forName: Notification.Name.UIApplicationDidBecomeActive,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.didBecomeActiveSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: Notification.Name.UIApplicationWillResignActive,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.willResignActiveSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: Notification.Name.UIApplicationDidEnterBackground,
        object: application,
        queue: queue,
        using: { [weak self] _ in
          self?.didEnterBackgroundSubject.onNext(())
        }
      ))

      observers.append(center.addObserver(
        forName: Notification.Name.UIApplicationWillEnterForeground,
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
