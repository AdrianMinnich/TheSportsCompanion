//
//  ResultsCoordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class ResultsCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        navigationController.navigationBar.prefersLargeTitles = true
        
        let vc = ResultsViewController.instantiate()
        
        vc.navigationItem.titleView = ViewUtils.customizeLargeTitle(text: "Results", width: vc.view.bounds.width)
        vc.coordinator = self
        
        navigationController.viewControllers = [vc]
        
    }
    
    func tapTest() {
        let vc = TestViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
