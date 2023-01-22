//
//  Environment.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import Foundation

class Environment {
    static var shared = Environment()

    private let LEAGUE_ID = "39"
    private let TIMEZONE = "Europe/Warsaw"
    private let API_KEY = "772108f010bd04d2fb36365e37d352ef"
    private let API_HOSTNAME = "v3.football.api-sports.io"

    var leagueID: String {
        LEAGUE_ID
    }

    var timezone: String {
        TIMEZONE
    }

    var apiKey: String {
        API_KEY
    }

    var apiHostname: String {
        API_HOSTNAME
    }

}
