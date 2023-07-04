//
//  JumpGameIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/03/2022.
//

import XCTest

@testable import LeetCode

final class JumpGameIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, 1, 1, 4]
        
        let result = JumpGameII.jump(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [2, 3, 0, 1, 4]
        
        let result = JumpGameII.jump(nums)
        
        XCTAssertEqual(result, 2)
    }
}
