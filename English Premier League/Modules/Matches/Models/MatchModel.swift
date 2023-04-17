//
//  MatchModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 14/04/2023.
//

import Foundation

struct MatchModel: Identifiable, Hashable, Equatable {
    
    public let id: String
    public let homeTeamName: String
    public let awayTeamName: String
    public let date: Date?
    
    private let result: ResultModel?
    private var time: String {
        if let date {
            return  Converter().convertToTimeString(date: date)
        }
        return "Unknown Time"
    }
    
    public var dateString: String {
        if let date {
            return Converter().convertToDateString(date: date)
        }
        return "UnKnown Date"
    }
    
    public var shownData: String {
        if let result {
            return result.toString()
        }
        return time
    }
    
    init(id: String, homeTeam: String, awayTeam: String, result: ResultModel?, date: Date?) {
        self.id = id
        self.homeTeamName = homeTeam
        self.awayTeamName = awayTeam
        self.result = result
        self.date = date
    }
    
    init(matchAPIModel: MatchAPIModel) {
        self.id = "\(matchAPIModel.id)"
        self.homeTeamName = matchAPIModel.homeTeam.name.rawValue
        self.awayTeamName = matchAPIModel.awayTeam.name.rawValue
        self.date = Converter().convert(string: matchAPIModel.utcDate)
        
        if let homeScore = matchAPIModel.score.fullTime.homeTeam,
           let awayScore = matchAPIModel.score.fullTime.awayTeam {
            self.result = ResultModel(homeTeamScore: homeScore, awayTeamScore: awayScore)
        } else {
            self.result = nil
        }
    }
    
    static func == (lhs: MatchModel, rhs: MatchModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}


struct ResultModel {
    let homeTeamScore: Int
    let awayTeamScore: Int
    
    func toString()-> String {
        return "\(homeTeamScore) - \(awayTeamScore)"
    }
}
