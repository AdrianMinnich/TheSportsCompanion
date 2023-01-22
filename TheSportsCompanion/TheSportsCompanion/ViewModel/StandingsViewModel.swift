//
//  StandingsViewModel.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import Foundation
import RxSwift

class StandingsViewModel {
    let title = "Standings"

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func getTeamStandingViewModels() -> Observable<[TeamStandingViewModel]> {
        networkService.getStandings(for: "2022").map {
            ($0.response.first?.league.standings.first?.map { TeamStandingViewModel(standing: $0)})!
        }
    }
}
