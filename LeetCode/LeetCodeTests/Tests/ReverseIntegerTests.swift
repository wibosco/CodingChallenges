//
//  ReverseIntegerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 07/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class ReverseIntegerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let x = 123
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, 321)
    }
    
    func test_B() {
        let x = -123
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, -321)
    }
    
    func test_C() {
        let x = 120
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, 21)
    }
    
    func test_D() {
        let x = 0
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, 0)
    }
    
    func test_E() {
        let x = 1534236469
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, 0)
    }
    
    func test_F() {
        let x = -1463847412
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, -2147483641)
    }
    
    func test_G() {
        let x = -9463847412
        
        let reversed = ReverseInteger.reverse(x)
        
        XCTAssertEqual(reversed, 0)
    }
}
