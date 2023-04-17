//
//  Calculator.swift
//  English Premier League
//
//  Created by Yehia Samak on 17/04/2023.
//

import Foundation

struct Calculator {
    func isThisDayNotInThePast(date: Date) -> Bool{
        var calender = Calendar.current
        calender.timeZone = TimeZone.current
        let result = calender.compare(date, to: Date(), toGranularity: .day)
        return result == .orderedSame || result == .orderedDescending
    }
    
    func compareStringDates(_ date1: String, _ date2: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
       
        if let firstDate = dateFormatter.date(from:date1), let secondDate = dateFormatter.date(from: date2) {
            return firstDate < secondDate
        }
        return true
    }
}
