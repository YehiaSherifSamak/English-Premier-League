//
//  Date+Extention.swift
//  English Premier League
//
//  Created by Yehia Samak on 16/04/2023.
//

import Foundation

extension Date {
    func convert(string: String)-> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: string)
    }
}
