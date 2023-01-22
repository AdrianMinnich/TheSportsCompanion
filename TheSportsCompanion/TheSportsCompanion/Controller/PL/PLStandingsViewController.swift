//
//  PLStandingsViewController.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 22/07/2022.
//

import UIKit
import RxSwift
import RxCocoa

class PLStandingsViewController: UIViewController, Storyboarded {
    weak var coordinator: Coordinator?

    private let disposeBag = DisposeBag()

    private let viewModel: StandingsViewModel = StandingsViewModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }

    private func setUpTableView() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.getTeamStandingViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(
                cellIdentifier: TeamStandingTableViewCell.identifier,
                cellType: TeamStandingTableViewCell.self)) { _, viewModel, cell in
                    cell.configure(with: viewModel)
                }.disposed(by: disposeBag)
    }
}
