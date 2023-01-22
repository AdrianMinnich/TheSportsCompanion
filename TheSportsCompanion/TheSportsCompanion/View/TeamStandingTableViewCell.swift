//
//  TeamStandingTableViewCell.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import UIKit

class TeamStandingTableViewCell: UITableViewCell {
    static let identifier = "TeamStandingTableViewCell"

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var drawsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var goalDiffLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!

    func configure(with viewModel: TeamStandingViewModel) {
        let shortName = TeamShortName.getShortName(for: viewModel.name)
        self.rankLabel.text = viewModel.rank
        self.logoImageView.image = UIImage(named: shortName)
        self.nameLabel.text = shortName
        self.gamesPlayedLabel.text = viewModel.gamesPlayed
        self.winsLabel.text = viewModel.wins
        self.drawsLabel.text = viewModel.draws
        self.lossesLabel.text = viewModel.losses
        self.goalDiffLabel.text = viewModel.goalsDiff
        self.pointsLabel.text = viewModel.points
    }
}
