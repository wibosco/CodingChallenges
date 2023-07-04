//
//  SearchInRotatedSortedArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SearchInRotatedSortedArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [4, 5, 6, 7, 0, 1, 2]
        let target = 0
        
        let result = SearchInRotatedSortedArray.search(nums, target)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [4, 5, 6, 7, 0, 1, 2]
        let target = 3
        
        let result = SearchInRotatedSortedArray.search(nums, target)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [1]
        let target = 0
        
        let result = SearchInRotatedSortedArray.search(nums, target)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let nums = [3, 1]
        let target = 3
        
        let result = SearchInRotatedSortedArray.search(nums, target)
        
        XCTAssertEqual(result, 0)
    }
}
