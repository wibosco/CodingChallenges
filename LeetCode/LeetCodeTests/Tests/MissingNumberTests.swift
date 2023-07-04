//
//  MissingNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/03/2023.
//

import XCTest

@testable import LeetCode

final class MissingNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 0, 1]
        
        let result = MissingNumber.missingNumber(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [0, 1]
        
        let result = MissingNumber.missingNumber(nums)
        
        XCTAssertEqual(result, 2)
    }

    func test_C() {
        let nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]
        
        let result = MissingNumber.missingNumber(nums)
        
        XCTAssertEqual(result, 8)
    }
}
