//
//  PlusOneTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/03/2022.
//

import XCTest

@testable import LeetCode

class PlusOneTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let digits = [1, 2, 3]
        
        let sum = PlusOne.plusOne(digits)
        
        XCTAssertEqual(sum, [1, 2, 4])
    }
    
    func test_B() {
        let digits = [4, 3, 2, 1]
        
        let sum = PlusOne.plusOne(digits)
        
        XCTAssertEqual(sum, [4, 3, 2, 2])
    }
    
    func test_C() {
        let digits = [9]
        
        let sum = PlusOne.plusOne(digits)
        
        XCTAssertEqual(sum, [1,0])
    }
}
