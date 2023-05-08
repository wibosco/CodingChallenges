//
//  BinarySearchTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BinarySearchTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [-1, 0, 3, 5, 9, 12]
        let target = 9
        
        let result = BinarySearch.search(nums, target)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [-1, 0, 3, 5, 9, 12]
        let target = 2
        
        let result = BinarySearch.search(nums, target)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [5]
        let target = 5
        
        let result = BinarySearch.search(nums, target)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let target = 6
        
        let result = BinarySearch.search(nums, target)
        
        XCTAssertEqual(result, 5)
    }
}
