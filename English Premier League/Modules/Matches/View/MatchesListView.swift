//
//  ContentView.swift
//  English Premier League
//
//  Created by Yehia Samak on 10/04/2023.
//

import SwiftUI

struct MatchesListView: View {
    @StateObject var viewModel: MatchesViewModel
    
    
    
    var body: some View {
        NavigationStack {
            Toggle(isOn: $viewModel.showOnlyFavorties) {
                Text("Show favaroites only")
            }
            .padding()
            
            ZStack {
                List {
                    ForEach(viewModel.matches.sorted(by: { dic1, dic2 in
                        return Calculator().compareStringDates(dic1.key, dic2.key)
                    }), id: \.key) { key, value in
                        Section(key) {
                            ForEach(value) { match in
                                MatchView(match: match, favaorties: viewModel.favorites)
                            }
                        }
                    }
                }
                .navigationTitle("Matches")
            }
        }
        .onAppear{
            viewModel.requestMatches()
        }
        .alert("Error", isPresented: $viewModel.showError,
               actions: {
            Button("ok", role: .cancel) {}
        },message: {
            Text(viewModel.networkError?.localizedDescription ?? "")
        })
        
        if viewModel.isLoading {
            VStack {
                Spacer()
                ProgressView("loading")
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.black)
                Spacer()
            }
        }
        
    }
    
    
    
}

struct MatchesListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesListView(viewModel: MatchesViewModel(matchesService: MatchesService(networkRequest: NetworkManger()), favorites: FavoriteMatches()))
        
    }
}
