//
//  ContentView.swift
//  English Premier League
//
//  Created by Yehia Samak on 10/04/2023.
//

import SwiftUI

struct MatchesListView: View {
    @StateObject var viewModel = MatchesViewModel(matchesService: MatchesService(networkRequest: NetworkManger()))
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.diviedMatches.sorted(by: { dic1, dic2 in
                    return Calculator().compareStringDates(dic1.key, dic2.key)
                }), id: \.key) { key, value in
                    Section(key) {
                        ForEach(value) { match in
                            MatchView(match: match)
                        }
                    }
                }
            }
            .navigationTitle("Matches")
        }
        .onAppear{
            viewModel.requestMatches()
        }
        
        
    }
}

struct MatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView()
        
    }
}
