//
//  JumpGameTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/03/2022.
//

import XCTest

@testable import LeetCode

class JumpGameTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, 1, 1, 4]
        
        let canJump = JumpGame.canJump(nums)
        
        XCTAssertTrue(canJump)
    }
    
    func test_B() {
        let nums = [3, 2, 1, 0, 4]
        
        let canJump = JumpGame.canJump(nums)
        
        XCTAssertFalse(canJump)
    }
    
    func test_C() {
        let nums = [0]
        
        let canJump = JumpGame.canJump(nums)
        
        XCTAssertTrue(canJump)
    }
    
    func test_D() {
        let nums = [1, 2, 3]
        
        let canJump = JumpGame.canJump(nums)
        
        XCTAssertTrue(canJump)
    }
}
