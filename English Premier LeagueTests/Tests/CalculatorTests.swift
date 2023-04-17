//
//  CalculatorTests.swift
//  English Premier LeagueTests
//
//  Created by Yehia Samak on 17/04/2023.
//

import XCTest
@testable import English_Premier_League

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }
    
    override func tearDown() {
        self.calculator = nil
        super.tearDown()
    }
    
    func testIsThisDayNotInThePastReturnsTrueForCurrentDate() {
        XCTAssertTrue(calculator.isThisDayNotInThePast(date: Date()))
    }
    
    func testIsThisDayNotInThePastReturnsFalseForPastDate() {
        let pastDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        XCTAssertFalse(calculator.isThisDayNotInThePast(date: pastDate))
    }
    
    func testCompareStringDatesReturnsTrueForEarlierDate() {
        let earlierDate = "01 JAN 2023"
        let laterDate = "02 JAN 2023"
        XCTAssertTrue(calculator.compareStringDates(earlierDate, laterDate))
    }
    
    func testCompareStringDatesReturnsFalseForLaterDate() {
        let earlierDate = "01 JAN 2023"
        let laterDate = "31 DEC 2022"
        XCTAssertFalse(calculator.compareStringDates(earlierDate, laterDate))
    }
}
