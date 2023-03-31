//
//  FindFirstAndLastPositionOfElementInSortedArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindFirstAndLastPositionOfElementInSortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [5, 7, 7, 8, 8, 10]
        let target = 8
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [3, 4])
    }
    
    func test_B() {
        let nums = [5, 7, 7, 8, 8, 10]
        let target = 6
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [-1, -1])
    }
    
    func test_C() {
        let nums = [Int]()
        let target = 0
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [-1, -1])
    }
    
    func test_D() {
        let nums = [1]
        let target = 1
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [0, 0])
    }
    
    func test_E() {
        let nums = [2, 2]
        let target = 2
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [0, 1])
    }
    
    func test_F() {
        let nums = [1, 3]
        let target = 1
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [0, 0])
    }
    
    func test_G() {
        let nums = [1, 1, 2]
        let target = 1
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [0, 1])
    }
    
    func test_H() {
        let nums = [3, 3, 3]
        let target = 3
        
        let range = FindFirstAndLastPositionOfElementInSortedArray.searchRange(nums, target)
        
        XCTAssertEqual(range, [0, 2])
    }
}
