//
//  IntersectionOfThreeSortedArraysTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/04/2022.
//

import XCTest

@testable import LeetCode

final class IntersectionOfThreeSortedArraysTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let arr1 = [1, 2, 3, 4, 5]
        let arr2 = [1, 2, 5, 7, 9]
        let arr3 = [1, 3, 4, 5, 8]
        
        let result = IntersectionOfThreeSortedArrays().arraysIntersection(arr1, arr2, arr3)
        
        XCTAssertEqual(result, [1, 5])
    }
    
    func test_B() {
        let arr1 = [197, 418, 523, 876, 1356]
        let arr2 = [501, 880, 1593, 1710, 1870]
        let arr3 = [521, 682, 1337, 1395, 1764]
        
        let result = IntersectionOfThreeSortedArrays().arraysIntersection(arr1, arr2, arr3)
        
        XCTAssertEqual(result, [])
    }
}
