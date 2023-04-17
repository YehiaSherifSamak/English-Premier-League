//
//  MatchView.swift
//  English Premier League
//
//  Created by Yehia Samak on 13/04/2023.
//

import SwiftUI

struct MatchView: View {
    @State var match: MatchModel
    var body: some View {
        HStack {
            Text(match.homeTeamName)
                //.foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title3)
            Text(match.shownData)
              //  .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.medium)
            Text(match.awayTeamName)
               // .foregroundColor(.white)
                .bold()
                .font(.title3)
            Button {
                print("tapped")
            } label: {
                Image(systemName: "star")
                    .tint(.black)
            }
        }
        .padding()
        .cornerRadius(12)
        
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(match: MatchModel(id: "jn", homeTeam: "Al Ahly", awayTeam: "Al Zamalak", result: ResultModel(homeTeamScore: 2, awayTeamScore: 2), date: Date()))
    }
}
