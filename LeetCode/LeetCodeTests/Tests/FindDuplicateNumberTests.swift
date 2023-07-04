//
//  FindDuplicateNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindDuplicateNumberTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 3, 4, 2, 2]
        
        let result = FindDuplicateNumber.findDuplicate(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [3, 1, 3, 4, 2]
        
        let result = FindDuplicateNumber.findDuplicate(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let nums = [1, 1]
        
        let result = FindDuplicateNumber.findDuplicate(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let nums = [1, 1, 2]
        
        let result = FindDuplicateNumber.findDuplicate(nums)
        
        XCTAssertEqual(result, 1)
    }
}
