//
//  KthLargestElementInArrayTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class KthLargestElementInArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 2, 1, 5, 6, 4]
        let k = 2
        
        let element = KthLargestElementInArray.findKthLargest(nums, k)
        
        XCTAssertEqual(element, 5)
    }
    
    func test_B() {
        let nums = [3, 2, 3, 1, 2, 4, 5, 5, 6]
        let k = 4
        
        let element = KthLargestElementInArray.findKthLargest(nums, k)
        
        XCTAssertEqual(element, 4)
    }
    
    func test_C() {
        let nums = [2, 1]
        let k = 1
        
        let element = KthLargestElementInArray.findKthLargest(nums, k)
        
        XCTAssertEqual(element, 2)
    }
    
    func test_D() {
        let nums = [3, 1, 2, 4]
        let k = 2
        
        let element = KthLargestElementInArray.findKthLargest(nums, k)
        
        XCTAssertEqual(element, 3)
    }
}
