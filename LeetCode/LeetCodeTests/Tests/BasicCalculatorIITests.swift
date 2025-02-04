//
//  BasicCalculatorIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/02/2022.
//

import XCTest

@testable import LeetCode

final class BasicCalculatorIITests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "3+2*2"
        
        let result = BasicCalculatorII().calculate(s)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_B() {
        let s = " 3/2 "
        
        let result = BasicCalculatorII().calculate(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let s = " 3+5 / 2 "
        
        let result = BasicCalculatorII().calculate(s)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_D() {
        let s = "1"
        
        let result = BasicCalculatorII().calculate(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_E() {
        let s = "0-2147483647"
        
        let result = BasicCalculatorII().calculate(s)
        
        XCTAssertEqual(result, -2147483647)
    }
}
