//
//  MatchesViewModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation
import Combine


class MatchesViewModel: ObservableObject {
    @Published var matches: [MatchModel] = []
    
    let matchesService: MatchesServiceable
    var canceler: Cancellable?
    
    init(matchesService: MatchesServiceable) {
        self.matchesService = matchesService
    }
    
}

extension MatchesViewModel {
    func requestMatches() {
        canceler =  matchesService
            .getMatches()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { complation in
                print("complation")
            }, receiveValue: { [weak self] matchesAPIModel in
                guard let self else { return }
                self.matches.append(contentsOf: self.convert(matchesAPIModel: matchesAPIModel))
            })
    }
    
    func convert(matchesAPIModel: MatchesAPIModel)->  [MatchModel] {
        var matches: [MatchModel] = []
        
        for match in matchesAPIModel.matches {
            matches.append(MatchModel(matchAPIModel: match))
        }
        return matches
    }
}
