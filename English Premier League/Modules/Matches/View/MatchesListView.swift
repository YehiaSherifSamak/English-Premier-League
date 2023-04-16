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
            List(viewModel.matches){ match in
                MatchView(match: match)
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
