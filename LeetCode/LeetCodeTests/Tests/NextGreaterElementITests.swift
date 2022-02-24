//
//  NextGreaterElementITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class NextGreaterElementITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums1 = [4, 1, 2]
        let nums2 = [1, 3, 4, 2]
        
        let greaterElements = NextGreaterElementI.nextGreaterElement(nums1, nums2)
        
        XCTAssertEqual(greaterElements, [-1, 3, -1])
    }
    
    func test_B() {
        let nums1 = [2, 4]
        let nums2 = [1, 2, 3, 4]
        
        let greaterElements = NextGreaterElementI.nextGreaterElement(nums1, nums2)
        
        XCTAssertEqual(greaterElements, [3, -1])
    }
}