//
//  PowTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PowTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let x = 2.00000
        let n = 10
        
        let pow = Pow.myPow(x, n)
        
        XCTAssertEqual(pow, 1024.0, accuracy: 0.001)
    }
    
    func test_B() {
        let x = 2.10000
        let n = 3
        
        let pow = Pow.myPow(x, n)
        
        XCTAssertEqual(pow, 9.26100, accuracy: 0.001)
    }
    
    func test_C() {
        let x = 2.00000
        let n = -2
        
        let pow = Pow.myPow(x, n)
        
        XCTAssertEqual(pow, 0.25000, accuracy: 0.001)
    }
    
    func test_D() {
        let x = 1.00000
        let n = -2147483648
        
        let pow = Pow.myPow(x, n)
        
        XCTAssertEqual(pow, 1, accuracy: 0.001)
    }
}
