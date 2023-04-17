//
//  FavoritesMatchesModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 17/04/2023.
//

import Foundation
import Combine

class FavoriteMatches: ObservableObject {
    private var matches: Set<String>
    private let saveKey: String = "Favorites"
    
    init() {
        self.matches = []
    }
    
    func contains(_ match: MatchModel)-> Bool {
        return self.matches.contains(match.id)
    }
    
    func add(_ match: MatchModel) {
        objectWillChange.send()
        matches.insert(match.id)
        
    }
    
    func remove(_ match: MatchModel) {
        objectWillChange.send()
        matches.remove(match.id)
    }
    
    func update(_ match: MatchModel) {
        contains(match) ? remove(match) : add(match)
    }
    
}
