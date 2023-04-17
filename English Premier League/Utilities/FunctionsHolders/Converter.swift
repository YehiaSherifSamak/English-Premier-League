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
        formatter.dateFormat = Constants.apiDateFormate
        return formatter.date(from: string)
    }
    
    func convertToTimeString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.timeFormate
        return formatter.string(from: date)
    }
    
    func convertToDateString(date: Date) -> String {
        var result = ""
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.shortDateFormate
        result = formatter.string(from: date)
        return result
    }
}
