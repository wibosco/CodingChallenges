//
//  MergeTwo2DArraysBySummingValuesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/06/2024.
//

import XCTest

@testable import LeetCode

final class MergeTwo2DArraysBySummingValuesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums1 = [[1,2],[2,3],[4,5]]
        let nums2 = [[1,4],[3,2],[4,1]]
        
        let result = MergeTwo2DArraysBySummingValues().mergeArrays(nums1, nums2)
        
        XCTAssertEqual(result, [[1,6],[2,3],[3,2],[4,6]])
    }
    
    func test_B() {
        let nums1 = [[2,4],[3,6],[5,5]]
        let nums2 = [[1,3],[4,3]]
        
        let result = MergeTwo2DArraysBySummingValues().mergeArrays(nums1, nums2)
        
        XCTAssertEqual(result, [[1,3],[2,4],[3,6],[4,3],[5,5]])
    }
    
    func test_C() {
        let nums1 = [[1,4],[2,6]]
        let nums2 = [[1,3],[2,3]]
        
        let result = MergeTwo2DArraysBySummingValues().mergeArrays(nums1, nums2)
        
        XCTAssertEqual(result, [[1,7],[2,9]])
    }
    
    func test_D() {
        let nums1 = [[1,3],[4,3]]
        let nums2 = [[2,4],[3,6],[5,5]]
        
        let result = MergeTwo2DArraysBySummingValues().mergeArrays(nums1, nums2)
        
        XCTAssertEqual(result, [[1,3],[2,4],[3,6],[4,3],[5,5]])
    }
}
