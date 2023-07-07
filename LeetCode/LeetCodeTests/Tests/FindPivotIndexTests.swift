//
//  FindPivotIndexTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/07/2023.
//

import XCTest

@testable import LeetCode

final class FindPivotIndexTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 7, 3, 6, 5, 6]
        
        let result = FindPivotIndex.pivotIndex(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [1, 2, 3]
        
        let result = FindPivotIndex.pivotIndex(nums)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [2, 1, -1]
        
        let result = FindPivotIndex.pivotIndex(nums)
        
        XCTAssertEqual(result, 0)
    }
}
