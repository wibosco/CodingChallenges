//
//  MinimumAverageOfSmallestAndLargestElementsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/08/2024.
//

import XCTest

@testable import LeetCode

final class MinimumAverageOfSmallestAndLargestElementsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [7,8,3,4,15,13,4,1]
        
        let result = MinimumAverageOfSmallestAndLargestElements().minimumAverage(nums)
        
        XCTAssertEqual(result, 5.5)
    }
    
    func test_B() {
        let nums = [1,9,8,3,10,5]
        
        let result = MinimumAverageOfSmallestAndLargestElements().minimumAverage(nums)
        
        XCTAssertEqual(result, 5.5)
    }
    
    func test_C() {
        let nums = [1,2,3,7,8,9]
        
        let result = MinimumAverageOfSmallestAndLargestElements().minimumAverage(nums)
        
        XCTAssertEqual(result, 5.0)
    }
}
