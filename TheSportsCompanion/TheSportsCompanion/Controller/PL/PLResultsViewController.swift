//
//  PLResultsViewController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 19/07/2022.
//

import UIKit

class PLResultsViewController: UIViewController, Storyboarded {
    weak var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.setTabBar(visible: false)
    }
}
