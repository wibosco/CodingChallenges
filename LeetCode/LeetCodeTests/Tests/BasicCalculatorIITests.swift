//
//  BasicCalculatorIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/02/2022.
//

import XCTest

@testable import LeetCode

class BasicCalculatorIITests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "3+2*2"
        
        let value = BasicCalculatorII.calculate(s)
        
        XCTAssertEqual(value, 7)
    }
    
    func test_B() {
        let s = " 3/2 "
        
        let value = BasicCalculatorII.calculate(s)
        
        XCTAssertEqual(value, 1)
    }
    
    func test_C() {
        let s = " 3+5 / 2 "
        
        let value = BasicCalculatorII.calculate(s)
        
        XCTAssertEqual(value, 5)
    }
}
