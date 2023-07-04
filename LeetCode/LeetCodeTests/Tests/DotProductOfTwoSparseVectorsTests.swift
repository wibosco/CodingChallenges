//
//  DotProductOfTwoSparseVectorsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/03/2022.
//

import XCTest

@testable import LeetCode

final class DotProductOfTwoSparseVectorsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums1 = [1, 0, 0, 2, 3]
        let nums2 = [0, 3, 0, 4, 0]
        
        let vector1 = SparseVector(nums1)
        let vector2 = SparseVector(nums2)
        
        let result = vector1.dotProduct(vector2)

        XCTAssertEqual(result, 8)
    }
    
    func test_B() {
        let nums1 = [0, 1, 0, 0, 0]
        let nums2 = [0, 0, 0, 0, 2]
        
        let vector1 = SparseVector(nums1)
        let vector2 = SparseVector(nums2)
        
        let result = vector1.dotProduct(vector2)

        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums1 = [0, 1, 0, 0, 2, 0, 0]
        let nums2 = [1, 0, 0, 0, 3, 0, 4]
        
        let vector1 = SparseVector(nums1)
        let vector2 = SparseVector(nums2)
        
        let result = vector1.dotProduct(vector2)

        XCTAssertEqual(result, 6)
    }
}
