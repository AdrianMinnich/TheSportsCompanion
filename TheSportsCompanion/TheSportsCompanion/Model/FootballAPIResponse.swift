//
//  FootballAPIResponse.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 22/07/2022.
//

import Foundation

struct FootballAPIResponse: Codable {
    let errors: [String]
    let response: [Response]
}

struct Response: Codable {
    let league: League
}

struct League: Codable {
    let id: Int
    let name: String
    let logo: String
    let standings: [[Standing]]
}

struct Standing: Codable {
    let rank: Int
    let team: Team
    let points: Int
    let goalsDiff: Int
    let form: String
    let allStats: Stats
    let homeStats: Stats
    let awayStats: Stats

    enum CodingKeys: String, CodingKey {
        case rank, team, points, goalsDiff, form
        case allStats = "all"
        case homeStats = "home"
        case awayStats = "away"
    }
}

struct Stats: Codable {
    let played: Int
    let win: Int
    let draw: Int
    let lose: Int
    let goals: Goals
}

struct Goals: Codable {
    let goalsFor: Int
    let goalsAgainst: Int

    enum CodingKeys: String, CodingKey {
        case goalsFor = "for"
        case goalsAgainst = "against"
    }
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
}
