//
//  TeamShortName.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import Foundation

struct TeamShortName {
    // swiftlint:disable:next cyclomatic_complexity
    static func getShortName(for name: String) -> String {
        switch name {
        case "Premier League": return "PL"
        case "Manchester City": return "MCI"
        case "Liverpool": return "LIV"
        case "Chelsea": return "CHE"
        case "Tottenham": return "TOT"
        case "Arsenal": return "ARS"
        case "Manchester United": return "MUN"
        case "West Ham": return "WHU"
        case "Leicester": return "LEI"
        case "Brighton": return "BHA"
        case "Wolves": return "WOL"
        case "Newcastle": return "NEW"
        case "Crystal Palace": return "CRY"
        case "Brentford": return "BRE"
        case "Aston Villa": return "AVL"
        case "Southampton": return "SOU"
        case "Everton": return "EVE"
        case "Leeds": return "LEE"
        case "Burnley": return "BUR"
        case "Watford": return "WAT"
        case "Norwich": return "NOR"
        case "Bournemouth": return "BOU"
        case "Fulham": return "FUL"
        case "Nottingham Forest": return "NFO"
        default: return "Not found"
        }
    }
}
