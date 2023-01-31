//
//  MainTabBarController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class MainTabBarController: UITabBarController, Storyboarded {
    let pl = PLCoordinator()
    let predictions = PredictionsCoordinator()
    let news = NewsCoordinator()
    let messages = MessagesCoordinator()
    let settings = SettingsCoordinator()

    override func viewDidLoad() {
        super.viewDidLoad()
        pl.navigationController.tabBarItem = UITabBarItem(title: "PL",
                                                               image: UIImage(systemName: "book"),
                                                               tag: 0)
        predictions.navigationController.tabBarItem = UITabBarItem(title: "Predicts",
                                                                   image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), // swiftlint:disable:this line_length
                                                                   tag: 0)
        news.navigationController.tabBarItem = UITabBarItem(title: "News",
                                                            image: UIImage(systemName: "newspaper"),
                                                            tag: 0)
        messages.navigationController.tabBarItem = UITabBarItem(title: "DM",
                                                                image: UIImage(systemName: "message"),
                                                                tag: 0)
        settings.navigationController.tabBarItem = UITabBarItem(title: "Settings",
                                                                image: UIImage(systemName: "gearshape"),
                                                                tag: 0)

        tabBar.tintColor = .white
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(
            color: .white,
            size: CGSize(width: tabBar.frame.width/CGFloat(5), height: tabBar.frame.height - 1),
            lineHeight: 1.0)

        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .black
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }

        viewControllers = [pl.navigationController,
                           predictions.navigationController,
                           news.navigationController,
                           messages.navigationController,
                           settings.navigationController]
    }
}
