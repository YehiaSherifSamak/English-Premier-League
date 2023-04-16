//
//  MatchModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 14/04/2023.
//

import Foundation

struct MatchModel {
    let homeTeamName: String
    let awayTeamName: String
    let result: ResultModel?
    let date: Date?
    var time: String {
        if let date {
            return  Converter().convertToTimeString(date: date)
        }
        return "Unknown Time"
    }
    
    var day: String {
        if let date {
            return Converter().convertToDateString(date: date)
        }
        return "UnKnown Date"
    }
    
    init(homeTeam: String, awayTeam: String, result: ResultModel?, date: Date?) {
        self.homeTeamName = homeTeam
        self.awayTeamName = awayTeam
        self.result = result
        self.date = date
    }
    
    init(matchAPIModel: MatchAPIModel) {
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
}


struct ResultModel {
    let homeTeamScore: Int
    let awayTeamScore: Int
}
