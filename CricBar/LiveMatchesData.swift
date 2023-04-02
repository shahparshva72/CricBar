//
//  MatchData.swift
//  CricBar
//
//  Created by Parshva Shah on 2/18/23.
//


import Foundation

// MARK: - LiveMatchesData
struct LiveMatchesData: Codable {
    let typeMatches: [TypeMatch]
    let filters: Filters
    let appIndex: AppIndex
    let responseLastUpdated: String
}

// MARK: - AppIndex
struct AppIndex: Codable {
    let seoTitle, webURL: String
}

// MARK: - Filters
struct Filters: Codable {
    let matchType: [String]
}

// MARK: - TypeMatch
struct TypeMatch: Codable {
    let matchType: String
    let seriesAdWrapper: [SeriesAdWrapper]
}

// MARK: - SeriesAdWrapper
struct SeriesAdWrapper: Codable {
    let seriesMatches: SeriesMatches?
    let adDetail: AdDetail?
}

// MARK: - AdDetail
struct AdDetail: Codable {
    let name, adLayout: String
    let position: Int
}

// MARK: - SeriesMatches
struct SeriesMatches: Codable {
    let seriesID: Int
    let seriesName: String
    let matches: [Match]
    
    enum CodingKeys: String, CodingKey {
        case seriesID = "seriesId"
        case seriesName, matches
    }
}

// MARK: - Match
struct Match: Codable {
    let matchInfo: MatchInfo
    let matchScore: MatchScore?
}

// MARK: - MatchInfo
struct MatchInfo: Codable {
    let matchID, seriesID: Int
    let seriesName, matchDesc, matchFormat, startDate: String
    let endDate, state, status: String
    let team1, team2: Team
    let venueInfo: VenueInfo
    let seriesStartDt, seriesEndDt: String
    let currentBatTeamID: Int?
    
    enum CodingKeys: String, CodingKey {
        case matchID = "matchId"
        case seriesID = "seriesId"
        case seriesName, matchDesc, matchFormat, startDate, endDate, state, status, team1, team2, venueInfo, seriesStartDt, seriesEndDt
        case currentBatTeamID = "currentBatTeamId"
    }
}

// MARK: - Team
struct Team: Codable {
    let teamID: Int
    let teamName, teamSName: String
    let imageID: Int
    
    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case teamName, teamSName
        case imageID = "imageId"
    }
}

// MARK: - VenueInfo
struct VenueInfo: Codable {
    let id: Int
    let ground, city, timezone: String
}

// MARK: - MatchScore
struct MatchScore: Codable {
    let team1Score, team2Score: TeamScore?
}

// MARK: - TeamScore
struct TeamScore: Codable {
    let inngs1: Inngs1
}

// MARK: - Inngs1
struct Inngs1: Codable {
    let inningsID, runs: Int
    let wickets: Int?
    let overs: Double
    let isDeclared: Bool?
    
    enum CodingKeys: String, CodingKey {
        case inningsID = "inningsId"
        case runs, wickets, overs, isDeclared
    }
}


extension TypeMatch: Identifiable {
    var id: String { matchType }
}

extension SeriesAdWrapper: Identifiable {
    var id: UUID { UUID() }
}

extension Match: Identifiable {
    var id: Int { matchInfo.matchID }
}
