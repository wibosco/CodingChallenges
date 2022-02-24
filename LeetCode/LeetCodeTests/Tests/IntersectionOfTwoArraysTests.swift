//
//  IntersectionOfTwoArraysTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode


class IntersectionOfTwoArraysTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums1 = [1, 2, 2, 1]
        let nums2 = [2, 2]
        
        let intersectingValues = IntersectionOfTwoArrays.intersection(nums1, nums2)
        
        XCTAssertEqual(intersectingValues, [2])
    }
    
    func test_B() {
        let nums1 = [4, 9, 5]
        let nums2 = [9, 4, 9, 8, 4]
        
        let intersectingValues = IntersectionOfTwoArrays.intersection(nums1, nums2)
        
        XCTAssertEqual(intersectingValues, [4, 9])
    }
}