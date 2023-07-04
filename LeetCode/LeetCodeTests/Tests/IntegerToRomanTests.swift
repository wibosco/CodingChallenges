//
//  IntegerToRomanTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class IntegerToRomanTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 3
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "III")
    }
    
    func test_B() {
        let num = 4
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "IV")
    }
    
    func test_C() {
        let num = 58
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "LVIII")
    }
    
    func test_D() {
        let num = 1994
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "MCMXCIV")
    }
    
    func test_E() {
        let num = 300
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "CCC")
    }
    
    func test_F() {
        let num = 3897
        
        let result = IntegerToRoman.intToRoman(num)
        
        XCTAssertEqual(result, "MMMDCCCXCVII")
    }

}
