//
//  JumpGameTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/03/2022.
//

import XCTest

@testable import LeetCode

final class JumpGameTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, 1, 1, 4]
        
        let result = JumpGame.canJump(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [3, 2, 1, 0, 4]
        
        let result = JumpGame.canJump(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [0]
        
        let result = JumpGame.canJump(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let nums = [1, 2, 3]
        
        let result = JumpGame.canJump(nums)
        
        XCTAssertTrue(result)
    }
}
