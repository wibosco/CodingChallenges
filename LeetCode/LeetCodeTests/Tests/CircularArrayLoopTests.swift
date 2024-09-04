//
//  CircularArrayLoopTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/09/2024.
//

import XCTest

@testable import LeetCode

final class CircularArrayLoopTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2,-1,1,2,2]
        
        let result = CircularArrayLoop().circularArrayLoop(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [-1,-2,-3,-4,-5,6]
        
        let result = CircularArrayLoop().circularArrayLoop(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [1,-1,5,1,4]
        
        let result = CircularArrayLoop().circularArrayLoop(nums)
        
        XCTAssertTrue(result)
    }
}
