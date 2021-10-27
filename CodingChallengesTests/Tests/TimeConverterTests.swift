//
//  TimeConverterTests.swift
//  CodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class TimeConverterTests: XCTestCase {
    
    // MARK: Tests
    
    func test_timeConverterPM() {
    
        let time = TimeConverter.convertFrom12HourTo24HourUsingDateManipulation(time: "07:05:45PM")
        
        XCTAssertEqual(time, "19:05:45")
        
        print(time)
    }
    
    func test_timeConverterAM() {
        
        let time = TimeConverter.convertFrom12HourTo24HourUsingDateManipulation(time: "03:05:32AM")
        
        XCTAssertEqual(time, "03:05:32")
    }
    
    func test_timeConverterNoon() {
        
        let time = TimeConverter.convertFrom12HourTo24HourUsingDateManipulation(time: "12:05:30PM")
        
        XCTAssertEqual(time, "12:05:30")
    }
    
    func test_timeConverterMidnight() {
        
        let time = TimeConverter.convertFrom12HourTo24HourUsingDateManipulation(time: "12:48:23AM")
        
        XCTAssertEqual(time, "00:48:23")
    }
    
}
