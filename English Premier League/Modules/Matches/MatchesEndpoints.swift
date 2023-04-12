//
//  MatchesEndpoints.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation

enum MatchesEndpoints: Request {
    
    case getMatches
    
    var url: String {
        switch self {
        case .getMatches:
            return "competitions/2021/matches"
        }
    }
    
    var headers: [String : String]? {
        return Constants.APIKey
    }
    
    var body: Data? {
        switch self {
        case .getMatches:
            return nil
        }
    }
    
    var requestTimeOut: Float? {
        return 10
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getMatches:
            return .GET
        }
    }
}
