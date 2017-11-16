import UIKit
import RxSwift

/// Observe UIViewController life cycle events
public class ViewControllerLifeCycle {
  public var viewDidLoad: Observable<Void> {
    return dummyViewController.viewDidLoadSubject
  }

  public var viewWillAppear: Observable<Void> {
    return dummyViewController.viewWillAppearSubject
  }

  public var viewDidAppear: Observable<Void> {
    return dummyViewController.viewDidAppearSubject
  }

  public var viewWillDisappear: Observable<Void> {
    return dummyViewController.viewWillDisappearSubject
  }

  public var viewDidDisappear: Observable<Void> {
    return dummyViewController.viewDidDisappearSubject
  }

  // Use a dummy UIViewController to get forwarded events from container view controller
  private let dummyViewController: DummyViewController

  /// Add a dummy view controller so that it can forward events
  public init(viewController: UIViewController) {
    dummyViewController = DummyViewController()

    // Add
    viewController.addChildViewController(dummyViewController)
    viewController.view.addSubview(dummyViewController.view)
    dummyViewController.view.frame = .zero
    dummyViewController.view.autoresizingMask = []
    dummyViewController.didMove(toParentViewController: viewController)
  }
}

private extension ViewControllerLifeCycle {
  class DummyViewController: UIViewController {
    let viewDidLoadSubject = PublishSubject<Void>()
    let viewWillAppearSubject = PublishSubject<Void>()
    let viewDidAppearSubject = PublishSubject<Void>()
    let viewWillDisappearSubject = PublishSubject<Void>()
    let viewDidDisappearSubject = PublishSubject<Void>()

    override func viewDidLoad() {
      super.viewDidLoad()

      viewDidLoadSubject.onNext(())
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      viewWillAppearSubject.onNext(())
    }

    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      viewDidAppearSubject.onNext(())
    }

    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      viewWillDisappearSubject.onNext(())
    }

    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)

      viewDidDisappearSubject.onNext(())
    }
  }
}
