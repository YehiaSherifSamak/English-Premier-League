//
//  Configurator.swift
//  English Premier League
//
//  Created by Yehia Samak on 17/04/2023.
//

import Foundation
import SwiftUI

protocol Configuratable {
    associatedtype T: View
       var view: T { get }
}

enum MatchesConfigurator: Configuratable {
    case matches
    
    var view: some View {
        switch self {
        case .matches:
            let networkManger = NetworkManger()
            let fav = FavoriteMatches()
            let service = MatchesService(networkRequest: networkManger)
            let vm = MatchesViewModel(matchesService: service, favorites: fav)
            return MatchesListView(viewModel: vm)
        }
    }
}
