//
//  PLCoordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 19/07/2022.
//

import UIKit

class PLCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true

        let vc = PLViewController.instantiate()
        vc.navigationItem.titleView = ViewUtils.customizeLargeTitle(text: "PL", width: vc.view.bounds.width)
        vc.coordinator = self

        navigationController.viewControllers = [vc]

    }

    func tapResults() {
        let vc = PLResultsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func tapStandings() {
        let vc = PLStandingsViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
