//
//  MatchesRepositry.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation
import Combine

protocol MatchesServiceable {
    func getMatches()-> AnyPublisher<MatchesAPIModel, NetworkError>
}

class MatchesService: MatchesServiceable {
    private var networkRequest: Requestable
    
    init(networkRequest: Requestable) {
        self.networkRequest = networkRequest
    }
    
    func getMatches()-> AnyPublisher<MatchesAPIModel, NetworkError>{
        let request = MatchesEndpoints.getMatches.createRequest()
        return networkRequest.request(request)
    }
}
