//
//  SearchInRotatedSortedArrayIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SearchInRotatedSortedArrayIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 5, 6, 0, 1, 2]
        let target = 0
        
        let exists = SearchInRotatedSortedArrayII.search(nums, target)
        
        XCTAssertTrue(exists)
    }
    
    func test_B() {
        let nums = [2, 5, 6, 0, 0, 1, 2]
        let target = 3
        
        let exists = SearchInRotatedSortedArrayII.search(nums, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_C() {
        let nums = [1, 0, 1, 1, 1]
        let target = 3
        
        let exists = SearchInRotatedSortedArrayII.search(nums, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_D() {
        let nums = [1, 0, 1, 1, 1]
        let target = 0
        
        let exists = SearchInRotatedSortedArrayII.search(nums, target)
        
        XCTAssertTrue(exists)
    }
    
    func test_E() {
        let nums = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1]
        let target = 2
        
        let exists = SearchInRotatedSortedArrayII.search(nums, target)
        
        XCTAssertTrue(exists)
    }
}
