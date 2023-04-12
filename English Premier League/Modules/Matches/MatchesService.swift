//
//  MatchesRepositry.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation

protocol MatchesServiceable {
    func getMatches()
}

class MatchesService: MatchesServiceable {
    private var networkRequest: Requestable
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    func getMatches() {
        
    }
}
