//
//  TestViewController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 11/07/2022.
//

import UIKit

class TestViewController: UIViewController, Storyboarded {
    weak var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.setTabBar(visible: false)
    }
}
