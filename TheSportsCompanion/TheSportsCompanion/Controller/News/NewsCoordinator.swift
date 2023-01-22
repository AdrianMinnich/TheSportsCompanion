//
//  NewsCoordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class NewsCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true

        let vc = NewsViewController.instantiate()
        vc.navigationItem.titleView = ViewUtils.customizeLargeTitle(text: "News", width: vc.view.bounds.width)
        vc.coordinator = self

        navigationController.viewControllers = [vc]
    }
}
