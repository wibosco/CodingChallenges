//
//  FindMinimumRotatedSortedArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class FindMinimumRotatedSortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 4, 5, 1, 2]
        
        let min = FindMinimumRotatedSortedArray.findMin(nums)
        
        XCTAssertEqual(min, 1)
    }
    
    func test_B() {
        let nums = [4, 5, 6, 7, 0, 1, 2]
        
        let min = FindMinimumRotatedSortedArray.findMin(nums)
        
        XCTAssertEqual(min, 0)
    }
    
    func test_C() {
        let nums = [11, 13, 15, 17]
        
        let min = FindMinimumRotatedSortedArray.findMin(nums)
        
        XCTAssertEqual(min, 11)
    }
}
