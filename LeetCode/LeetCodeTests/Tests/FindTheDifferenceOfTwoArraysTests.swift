//
//  FindTheDifferenceOfTwoArraysTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/07/2023.
//

import XCTest

@testable import LeetCode

final class FindTheDifferenceOfTwoArraysTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums1 = [1, 2, 3]
        let nums2 = [2, 4, 6]
            
        let result = FindTheDifferenceOfTwoArrays.findDifference(nums1, nums2)
        
        let first = result[0]
        let second = result[1]
        
        XCTAssertEqual(first.count, 2)
        XCTAssertEqual(second.count, 2)
        
        //order isn't important
        XCTAssertTrue(first.contains(1))
        XCTAssertTrue(first.contains(3))
        
        XCTAssertTrue(second.contains(4))
        XCTAssertTrue(second.contains(6))
    }
    
    func test_B() {
        let nums1 = [1, 2, 3, 3]
        let nums2 = [1, 1, 2, 2]
            
        let result = FindTheDifferenceOfTwoArrays.findDifference(nums1, nums2)
        
        let first = result[0]
        let second = result[1]
        
        XCTAssertEqual(first.count, 1)
        XCTAssertTrue(second.isEmpty)
        
        //order isn't important
        XCTAssertTrue(first.contains(3))
        
        XCTAssertEqual(result, [[3], []])
    }
}
