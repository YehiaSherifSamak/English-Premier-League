//
//  ContentView.swift
//  English Premier League
//
//  Created by Yehia Samak on 10/04/2023.
//

import SwiftUI

struct MatchesListView: View {
    // let viewModel = MatchesViewModel()
    let match = MatchModel(homeTeam: "Al Ahly", awayTeam: "Al Zamalak", result: ResultModel(homeTeamScore: 2, awayTeamScore: 2), date: Date())
    
    var body: some View {
        NavigationStack {
            List{
                MatchView(match: match)
                MatchView(match: match)
            }
            
            .navigationTitle("Matches")
        }
        
        
    }
}

struct MatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView()
        
    }
}
