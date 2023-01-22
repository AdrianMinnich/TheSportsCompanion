//
//  TeamStandingViewModel.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import Foundation
import UIKit

class TeamStandingViewModel {
    private let standing: Standing

    var rank: String {
        return "\(standing.rank)"
    }

    var logo: UIImage {
        return UIImage(named: "\(TeamShortName.getShortName(for: standing.team.name))")!
    }

    var name: String {
        return standing.team.name
    }

    var gamesPlayed: String {
        return "\(standing.allStats.played)"
    }

    var wins: String {
        return "\(standing.allStats.win)"
    }

    var draws: String {
        return "\(standing.allStats.draw)"
    }

    var losses: String {
        return "\(standing.allStats.lose)"
    }

    var goalsDiff: String {
        return "\(standing.goalsDiff)"
    }

    var points: String {
        return "\(standing.points)"
    }

    init(standing: Standing) {
        self.standing = standing
    }
}
