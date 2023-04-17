//
//  MatchView.swift
//  English Premier League
//
//  Created by Yehia Samak on 13/04/2023.
//

import SwiftUI

struct MatchView: View {
    @State var match: MatchModel
    @StateObject var favaorties: FavoriteMatches
    
    var body: some View {
        HStack(alignment: .center, spacing: 12.0) {
            Text(match.homeTeamName)
                .fontWeight(.bold)
            Text(match.shownData)
                .fontWeight(.medium)
            Text(match.awayTeamName)
                .fontWeight(.bold)
            Button {
                favaorties.update(match)
            } label: {
                favaorties.contains(match) ? Image(systemName: "star.fill")
                    .tint(.red) : Image(systemName: "star")
                    .tint(.black)
            }
        }
        .padding()
        .cornerRadius(12)
        
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(match: MatchModel(id: "jn", homeTeam: "Al Ahly", awayTeam: "Al Zamalak", result: ResultModel(homeTeamScore: 2, awayTeamScore: 2), date: Date()), favaorties: FavoriteMatches())
    }
}
