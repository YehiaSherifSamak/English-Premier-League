//
//  MatchesViewModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation
import Combine


class MatchesViewModel {
    var cancable: Cancellable?
    let matchesService = MatchesService(networkRequest: NetworkManger())
    init() {
         cancable = matchesService.getMatches().sink(
            receiveCompletion: { completion in
            print(completion)
            
        }, receiveValue: { value in
            print(value)
        })
    }
}
