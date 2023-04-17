//
//  Converter.swift
//  English Premier League
//
//  Created by Yehia Samak on 16/04/2023.
//

import Foundation

struct Converter {
    func convert(string: String)-> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: string)
    }
    
    func convertToTimeString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func convertToDateString(date: Date) -> String {
        var result = ""
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        result = formatter.string(from: date)
        return result
    }
}
