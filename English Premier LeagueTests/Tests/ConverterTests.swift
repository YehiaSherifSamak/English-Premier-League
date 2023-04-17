//
//  ConverterTests.swift
//  English Premier LeagueTests
//
//  Created by Yehia Samak on 17/04/2023.
//

import XCTest
@testable import English_Premier_League

class ConverterTests: XCTestCase {
    
    func testConvertStringToDate() {
        let converter = Converter()
        
        // Test with a valid date string
        let dateString = "1997-02-02T02:26:51+0000"
        let expectedDate = Date(timeIntervalSinceReferenceDate: -123456789.0)
        XCTAssertEqual(converter.convert(string: dateString), expectedDate)
        
        // Test with an invalid date string
        let invalidDateString = "not a date"
        XCTAssertNil(converter.convert(string: invalidDateString))
    }
    
    func testConvertToTimeString() {
        let converter = Converter()
        
        // Test with a valid date
        let date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        
        XCTAssertEqual(converter.convertToTimeString(date: date), "04:26")
    }
    
    func testConvertToDateString() {
        let converter = Converter()
        
        // Test with a valid date
        let date = Date(timeIntervalSinceReferenceDate: -123456789.0)
        XCTAssertEqual(converter.convertToDateString(date: date), "2 Feb 1997")
    }
}
