//
//  JumpGameIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/03/2022.
//

import XCTest

@testable import LeetCode

class JumpGameIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, 1, 1, 4]
        
        let jumps = JumpGameII.jump(nums)
        
        XCTAssertEqual(jumps, 2)
    }
    
    func test_B() {
        let nums = [2, 3, 0, 1, 4]
        
        let jumps = JumpGameII.jump(nums)
        
        XCTAssertEqual(jumps, 2)
    }
}
