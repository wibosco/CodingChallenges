//
//  FibonacciNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FibonacciNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 2
        
        let result = FibonacciNumber.fib(n)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let n = 3
        
        let result = FibonacciNumber.fib(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let n = 4
        
        let result = FibonacciNumber.fib(n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let n = 0
        
        let result = FibonacciNumber.fib(n)
        
        XCTAssertEqual(result, 0)
    }
}
