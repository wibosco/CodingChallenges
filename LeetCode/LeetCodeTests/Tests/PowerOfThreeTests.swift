//
//  PowerOfThreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/04/2023.
//

import XCTest

@testable import LeetCode

final class PowerOfThreeTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let n = 27
        
        let result = PowerOfThree().isPowerOfThree(n)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = -1
        
        let result = PowerOfThree().isPowerOfThree(n)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 0
        
        let result = PowerOfThree().isPowerOfThree(n)
        
        XCTAssertFalse(result)
    }
}
