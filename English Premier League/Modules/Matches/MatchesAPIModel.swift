//
//  MatchesAPIModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//


import Foundation

struct MatchesAPIModel: Codable {
    let count: Int
    let filters: FiltersAPIModel
    let competition: CompetitionAPIModel
    let matches: [MatchAPIModel]
}

// MARK: - Competition
struct CompetitionAPIModel: Codable {
    let id: Int
    let area: AreaAPIModel
    let name, code, plan: String
    let lastUpdated: Date
}

// MARK: - Area
struct AreaAPIModel: Codable {
    let id: Int
    let name: TeamName
}

enum TeamName: String, Codable {
    case afcBournemouth = "AFC Bournemouth"
    case arsenalFC = "Arsenal FC"
    case astonVillaFC = "Aston Villa FC"
    case brentfordFC = "Brentford FC"
    case brightonHoveAlbionFC = "Brighton & Hove Albion FC"
    case chelseaFC = "Chelsea FC"
    case crystalPalaceFC = "Crystal Palace FC"
    case england = "England"
    case evertonFC = "Everton FC"
    case fulhamFC = "Fulham FC"
    case leedsUnitedFC = "Leeds United FC"
    case leicesterCityFC = "Leicester City FC"
    case liverpoolFC = "Liverpool FC"
    case manchesterCityFC = "Manchester City FC"
    case manchesterUnitedFC = "Manchester United FC"
    case newcastleUnitedFC = "Newcastle United FC"
    case nottinghamForestFC = "Nottingham Forest FC"
    case southamptonFC = "Southampton FC"
    case tottenhamHotspurFC = "Tottenham Hotspur FC"
    case westHamUnitedFC = "West Ham United FC"
    case wolverhamptonWanderersFC = "Wolverhampton Wanderers FC"
}

// MARK: - Filters
struct FiltersAPIModel: Codable {
}

// MARK: - Match
struct MatchAPIModel: Codable {
    let id: Int
    let season: SeasonAPIModel
    let utcDate: Date
    let status: StatusAPIModel
    let matchday: Int
    let stage: Stage
    let lastUpdated: Date
    let odds: OddsAPIModel
    let score: Score
    let homeTeam, awayTeam: AreaAPIModel
    let referees: [RefereeAPIModel]
}

// MARK: - Odds
struct OddsAPIModel: Codable {
    let msg: String
}


// MARK: - Referee
struct RefereeAPIModel: Codable {
    let id: Int
    let name: String
    let role: String
    let nationality: String
}


// MARK: - Score
struct Score: Codable {
    let winner: Winner?
    let duration: Duration
    let fullTime, halfTime, extraTime, penalties: ExtraTime
}

enum Duration: String, Codable {
    case regular = "REGULAR"
}

// MARK: - ExtraTime
struct ExtraTime: Codable {
    let homeTeam, awayTeam: Int?
}

enum Winner: String, Codable {
    case awayTeam = "AWAY_TEAM"
    case draw = "DRAW"
    case homeTeam = "HOME_TEAM"
}

// MARK: - Season
struct SeasonAPIModel: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
}

enum Stage: String, Codable {
    case regularSeason = "REGULAR_SEASON"
}

enum StatusAPIModel: String, Codable {
    case finished = "FINISHED"
    case postponed = "POSTPONED"
    case scheduled = "SCHEDULED"
}
