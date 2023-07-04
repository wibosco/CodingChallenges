//
//  ThreeSumClosestTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/03/2022.
//

import XCTest

@testable import LeetCode

final class ThreeSumClosestTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-1, 2, 1, -4]
        let target = 1
        
        let result = ThreeSumClosest.threeSumClosest(nums, target)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [0, 0, 0]
        let target = 1
        
        let result = ThreeSumClosest.threeSumClosest(nums, target)
        
        XCTAssertEqual(result, 0)
    }
}
