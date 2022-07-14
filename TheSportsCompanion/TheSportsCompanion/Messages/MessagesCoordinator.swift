//
//  MessagesCoordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class MessagesCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        navigationController.navigationBar.prefersLargeTitles = true
        
        let vc = MessagesViewController.instantiate()
        vc.navigationItem.titleView = ViewUtils.customizeLargeTitle(text: "DM", width: vc.view.bounds.width)
        vc.coordinator = self
        
        navigationController.viewControllers = [vc]
    }
}
