//
//  ValidPerfectSquareTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ValidPerfectSquareTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 16
        
        let result = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let num = 14
        
        let result = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let num = 4
        
        let result = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let num = 1
        
        let result = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(result)
    }
}
