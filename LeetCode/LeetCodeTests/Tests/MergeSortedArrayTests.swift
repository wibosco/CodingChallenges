//
//  MergeSortedArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class MergeSortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums1 = [1, 2, 3, 0, 0, 0]
        let m = 3
        let nums2 = [2, 5, 6]
        let n = 3
        
        MergeSortedArray.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1, 2, 2, 3, 5, 6])
    }
    
    func test_B() {
        var nums1 = [1]
        let m = 1
        let nums2 = [Int]()
        let n = 0
        
        MergeSortedArray.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1])
    }
    
    func test_C() {
        var nums1 = [0]
        let m = 0
        let nums2 = [1]
        let n = 1
        
        MergeSortedArray.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [1])
    }
    
    func test_D() {
        var nums1 = [-1, 0, 0, 3, 3, 3, 0, 0, 0]
        let m = 6
        let nums2 = [1, 2, 2]
        let n = 3
        
        MergeSortedArray.merge(&nums1, m, nums2, n)
        
        XCTAssertEqual(nums1, [-1, 0, 0, 1, 2, 2, 3, 3, 3])
    }
}
