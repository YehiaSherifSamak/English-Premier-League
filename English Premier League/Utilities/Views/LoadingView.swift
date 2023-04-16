//
//  LoadingView.swift
//  English Premier League
//
//  Created by Yehia Samak on 16/04/2023.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool

    var body: some View {
        if isLoading {
            ZStack {
                Color(.displayP3, white: 0, opacity: 0.3)
                ProgressView()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

