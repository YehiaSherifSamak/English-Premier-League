//
//  BaseViewModel.swift
//  English Premier League
//
//  Created by Yehia Samak on 17/04/2023.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    
    var networkError: NetworkError? {
        didSet {
            guard networkError != nil else { return }
            showError = true
        }
    }
}
