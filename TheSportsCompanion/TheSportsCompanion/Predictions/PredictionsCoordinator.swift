//
//  PredictionsCoordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class PredictionsCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        navigationController.navigationBar.prefersLargeTitles = true
        
        let vc = PredictionsViewController.instantiate()
        vc.navigationItem.titleView = ViewUtils.customizeLargeTitle(text: "Predicts", width: vc.view.bounds.width)
        vc.coordinator = self
        
        navigationController.viewControllers = [vc]
    }
}
