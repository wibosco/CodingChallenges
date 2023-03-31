//
//  TimeInWordsTests.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class TimeInWordsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 15)
        
        XCTAssertEqual("quarter past five", timeInWords)
    }
    
    func test_B() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 0)
        
        XCTAssertEqual("five o' clock", timeInWords)
    }
    
    func test_C() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 01)
        
        XCTAssertEqual("one minute past five", timeInWords)
    }
    
    func test_D() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 10)
        
        XCTAssertEqual("ten minutes past five", timeInWords)
    }
    
    func test_E() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 30)
        
        XCTAssertEqual("half past five", timeInWords)
    }
    
    func test_F() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 40)
        
        XCTAssertEqual("twenty minutes to six", timeInWords)
    }
    
    func test_G() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 45)
        
        XCTAssertEqual("quarter to six", timeInWords)
    }
    
    func test_H() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 5, minute: 59)
        
        XCTAssertEqual("one minute to six", timeInWords)
    }
    
    func test_I() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 12, minute: 47)
        
        XCTAssertEqual("thirteen minutes to one", timeInWords)
    }
    
    func test_J() {
        
        let timeInWords = TimeInWords.timeInWords(hour: 7, minute: 29)
        
        XCTAssertEqual("twenty nine minutes past seven", timeInWords)
    }
}
