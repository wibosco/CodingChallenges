//
//  RomanToIntegerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class RomanToIntegerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "III"
        
        let arabic = RomanToInteger.romanToInt(s)
        
        XCTAssertEqual(arabic, 3)
    }
    
    func test_B() {
        let s = "IV"
        
        let arabic = RomanToInteger.romanToInt(s)
        
        XCTAssertEqual(arabic, 4)
    }
    
    func test_C() {
        let s = "IX"
        
        let arabic = RomanToInteger.romanToInt(s)
        
        XCTAssertEqual(arabic, 9)
    }
    
    func test_D() {
        let s = "LVIII"
        
        let arabic = RomanToInteger.romanToInt(s)
        
        XCTAssertEqual(arabic, 58)
    }
    
    func test_E() {
        let s = "MCMXCIV"
        
        let arabic = RomanToInteger.romanToInt(s)
        
        XCTAssertEqual(arabic, 1994)
    }

}
