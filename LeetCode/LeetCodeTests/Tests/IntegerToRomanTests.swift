//
//  IntegerToRomanTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class IntegerToRomanTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 3
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "III")
    }
    
    func test_B() {
        let num = 4
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "IV")
    }
    
    func test_C() {
        let num = 58
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "LVIII")
    }
    
    func test_D() {
        let num = 1994
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "MCMXCIV")
    }
    
    func test_E() {
        let num = 300
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "CCC")
    }
    
    func test_F() {
        let num = 3897
        
        let roman = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(roman, "MMMDCCCXCVII")
    }

}
