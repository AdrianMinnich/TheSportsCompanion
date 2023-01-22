//
//  PLViewController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 19/07/2022.
//

import UIKit

class PLViewController: UIViewController, Storyboarded {
    weak var coordinator: PLCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.setTabBar(visible: true)
    }

    @IBAction func didTapResults(_ sender: Any) {
        coordinator?.tapResults()
    }

    @IBAction func didTapStandings(_ sender: Any) {
        coordinator?.tapStandings()
    }
}
