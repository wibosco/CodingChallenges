//
//  NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThresholdTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 19/07/2023.
//

import XCTest

@testable import LeetCode

final class NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThresholdTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let arr = [2, 2, 2, 2, 5, 5, 5, 8]
        let k = 3
        let threshold = 4
        
        let result = NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThreshold.numOfSubarrays(arr, k, threshold)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let arr = [11, 13, 17, 23, 29, 31, 7, 5, 2, 3]
        let k = 3
        let threshold = 5
        
        let result = NumberOfSubarraysOfSizeKAndAverageGreaterThanOrEqualToThreshold.numOfSubarrays(arr, k, threshold)
        
        XCTAssertEqual(result, 6)
    }
}
