//
//  ResultsViewController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

class ResultsViewController: UIViewController, Storyboarded {
    weak var coordinator: ResultsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.setTabBar(visible: true)
    }
    
    @IBAction func tapTest(_ sender: Any) {
        coordinator?.tapTest()
    }
}
