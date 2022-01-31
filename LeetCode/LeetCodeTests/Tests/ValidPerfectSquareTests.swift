//
//  ValidPerfectSquareTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class ValidPerfectSquareTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 16
        
        let perfectSquare = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(perfectSquare)
    }
    
    func test_B() {
        let num = 14
        
        let perfectSquare = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertFalse(perfectSquare)
    }
    
    func test_C() {
        let num = 4
        
        let perfectSquare = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(perfectSquare)
    }
    
    func test_D() {
        let num = 1
        
        let perfectSquare = ValidPerfectSquare.isPerfectSquare(num)
        
        XCTAssertTrue(perfectSquare)
    }
}
