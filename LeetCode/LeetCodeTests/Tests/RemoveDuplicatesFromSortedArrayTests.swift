//
//  RemoveDuplicatesFromSortedArray.swift
//  CodingChallengesTests
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class RemoveDuplicatesFromSortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums = [1, 1, 2]
        
        let length = RemoveDuplicatesFromSortedArray.removeDuplicates(&nums)
        
        XCTAssertEqual(length, 2)
        XCTAssertEqual(nums[0..<2], [1, 2])
    }
    
    func test_B() {
        var nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
        
        let length = RemoveDuplicatesFromSortedArray.removeDuplicates(&nums)
        
        XCTAssertEqual(length, 5)
        XCTAssertEqual(nums[0..<5], [0, 1, 2, 3, 4])
    }
    
    func test_C() {
        var nums = [1]
        
        let length = RemoveDuplicatesFromSortedArray.removeDuplicates(&nums)
        
        XCTAssertEqual(length, 1)
        XCTAssertEqual(nums[0..<1], [1])
    }
}
