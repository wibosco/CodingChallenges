//
//  LargestPositiveIntegerThatExistsWithItsNegativeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/06/2024.
//

import XCTest

@testable import LeetCode

final class LargestPositiveIntegerThatExistsWithItsNegativeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-1,2,-3,3]
        
        let result = LargestPositiveIntegerThatExistsWithItsNegative().findMaxK(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [-1,10,6,7,-7,1]
        
        let result = LargestPositiveIntegerThatExistsWithItsNegative().findMaxK(nums)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let nums = [-10,8,6,7,-2,-3]
        
        let result = LargestPositiveIntegerThatExistsWithItsNegative().findMaxK(nums)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let nums = [5,5]
        
        let result = LargestPositiveIntegerThatExistsWithItsNegative().findMaxK(nums)
        
        XCTAssertEqual(result, -1)
    }
}
