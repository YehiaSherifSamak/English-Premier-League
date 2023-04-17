//
//  MatchesViewModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 12/04/2023.
//

import Foundation
import Combine


class MatchesViewModel: BaseViewModel {
    @Published var matches: [String: [MatchModel]] = [:]
    let favorites: FavoriteMatches
    var showOnlyFavorties: Bool = false {
        didSet {
            guard let matchesAPIModel else { return }
            matches = divideMatchesByDay(matches: convert(matchesAPIModel: matchesAPIModel))
        }
    }
    
    private let matchesService: MatchesServiceable
    private var canceler: Cancellable?
    private var matchesAPIModel: MatchesAPIModel?
    
    
    init(matchesService: MatchesServiceable, favorites: FavoriteMatches) {
        self.matchesService = matchesService
        self.favorites = favorites
    }
    
}

extension MatchesViewModel {
    func requestMatches() {
        isLoading = true
        canceler =  matchesService
            .getMatches()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] complation in
                guard let self else { return }
                self.isLoading = false
            }, receiveValue: { [weak self] matchesAPIModel in
                guard let self else { return }
                self.isLoading = false
                self.matchesAPIModel = matchesAPIModel
                self.matches = self.divideMatchesByDay(matches: self.convert(matchesAPIModel: matchesAPIModel))
            })
    }
    
    
    private func convert(matchesAPIModel: MatchesAPIModel)->  [MatchModel] {
        var matches: [MatchModel] = []
        
        for match in matchesAPIModel.matches {
            matches.append(MatchModel(matchAPIModel: match))
        }
        return showOnlyFavorties ? filterFavoirtes(matches: matches) : filterByDate(matches: matches)
    }
    
    private func divideMatchesByDay(matches: [MatchModel]) -> [String: [MatchModel]] {
        let dividedMatches = Dictionary(grouping: matches) { $0.dateString }
        
        return dividedMatches
    }
    
    private func filterByDate(matches: [MatchModel]) -> [MatchModel] {
        return matches.filter { match in
            return Calculator().isThisDayNotInThePast(date: match.date ?? Date())
        }
    }
    
   private func filterFavoirtes(matches: [MatchModel]) -> [MatchModel] {
        return matches.filter { match in
            return favorites.contains(match)
        }
    }
    
}
