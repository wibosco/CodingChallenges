//
//  DivideTwoIntegersTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 12/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class DivideTwoIntegersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let dividend = 10
        let divisor = 3
        
        let value = DivideTwoIntegers.divide(dividend, divisor)
        
        XCTAssertEqual(value, 3)
    }
    
    func test_B() {
        let dividend = 7
        let divisor = -3
        
        let value = DivideTwoIntegers.divide(dividend, divisor)
        
        XCTAssertEqual(value, -2)
    }
    
    func test_C() {
        let dividend = 0
        let divisor = 1
        
        let value = DivideTwoIntegers.divide(dividend, divisor)
        
        XCTAssertEqual(value, 0)
    }
    
    func test_D() {
        let dividend = 1
        let divisor = 1
        
        let value = DivideTwoIntegers.divide(dividend, divisor)
        
        XCTAssertEqual(value, 1)
    }
    
    func test_E() {
        let dividend = -2147483648
        let divisor = -1
        
        let value = DivideTwoIntegers.divide(dividend, divisor)
        
        XCTAssertEqual(value, 2147483647)
    }
}