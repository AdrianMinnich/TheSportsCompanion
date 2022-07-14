//
//  MainTabBarController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded {
    let results = ResultsCoordinator()
    let predictions = PredictionsCoordinator()
    let news = NewsCoordinator()
    let messages = MessagesCoordinator()
    let settings = SettingsCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        results.navigationController.tabBarItem = UITabBarItem(title: "Results", image: UIImage(systemName: "book"), tag: 0)
        predictions.navigationController.tabBarItem = UITabBarItem(title: "Predicts", image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), tag: 0)
        news.navigationController.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        messages.navigationController.tabBarItem = UITabBarItem(title: "DM", image: UIImage(systemName: "message"), tag: 0)
        settings.navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 0)
        
        tabBar.tintColor = .white
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: .white, size: CGSize(width: tabBar.frame.width/CGFloat(5), height: tabBar.frame.height - 1), lineHeight: 1.0)

        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .systemBackground
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
        
        viewControllers = [results.navigationController,
                           predictions.navigationController,
                           news.navigationController,
                           messages.navigationController,
                           settings.navigationController]
    }
}

extension MainTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard
            let fromControllerIndex = self.viewControllers?.firstIndex(of: fromVC),
            let toControllerIndex = self.viewControllers?.firstIndex(of: toVC) else {
            return nil
        }
        
        return TabAnimatedTransitioning(slideDirectionLeft: toControllerIndex > fromControllerIndex)
    }
}


class TabAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var slideLeft: Bool
    
    init(slideDirectionLeft: Bool) {
        self.slideLeft = slideDirectionLeft
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        if #available(iOS 13.0, *) {
            transitionContext.containerView.backgroundColor = .systemBackground
        } else {
            transitionContext.containerView.backgroundColor = nil // UIColor.white
        }
        
        transitionContext.containerView.addSubview(toVC.view)
        
        let navBar = (toVC as? UINavigationController)?.navigationBar
        let tabBar = toVC.tabBarController?.tabBar
        
        if #unavailable(iOS 15.0) {
            navBar?.isTranslucent = false
            navBar?.barTintColor = .systemBackground
            tabBar?.isTranslucent = false
            tabBar?.barTintColor = .systemBackground
        }
        
        var viewWidth = toVC.view.bounds.width
        if !self.slideLeft {
            viewWidth = -viewWidth
        }
        
        toVC.view.transform = CGAffineTransform(translationX: viewWidth, y: 0.0)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       delay: 0.0,
                       usingSpringWithDamping: 1.2,
                       initialSpringVelocity: 2.5,
                       options: UIView.AnimationOptions.transitionCurlUp,
                       animations: {
            toVC.view.transform = CGAffineTransform.identity
            fromVC?.view.transform = CGAffineTransform(translationX: -viewWidth, y: 0.0)
        },
                       completion: { finished in
            if finished {
                fromVC?.view.transform = CGAffineTransform.identity
                fromVC?.view.removeFromSuperview()
                if #unavailable(iOS 15.0) {
                    navBar?.isTranslucent = true
                    tabBar?.isTranslucent = true
                }
            }
            transitionContext.completeTransition(finished)
        })
    }
}
