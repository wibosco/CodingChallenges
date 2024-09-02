//
//  StrobogrammaticNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/09/2024.
//

import XCTest

@testable import LeetCode

final class StrobogrammaticNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = "69"
        
        let result = StrobogrammaticNumber().isStrobogrammatic(num)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let num = "88"
        
        let result = StrobogrammaticNumber().isStrobogrammatic(num)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let num = "962"
        
        let result = StrobogrammaticNumber().isStrobogrammatic(num)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let num = "2"
        
        let result = StrobogrammaticNumber().isStrobogrammatic(num)
        
        XCTAssertFalse(result)
    }
}
