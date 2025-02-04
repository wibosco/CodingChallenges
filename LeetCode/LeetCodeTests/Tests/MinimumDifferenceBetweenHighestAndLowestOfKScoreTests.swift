//
//  MinimumDifferenceBetweenHighestAndLowestOfKScoreTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/07/2023.
//

import XCTest

@testable import LeetCode

final class MinimumDifferenceBetweenHighestAndLowestOfKScoreTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [90]
        let k = 1
        
        let result = MinimumDifferenceBetweenHighestAndLowestOfKScore().minimumDifference(nums, k)
            
        XCTAssertEqual(result, 0)
    }
    
    func test_B() {
        let nums = [9, 4, 1, 7]
        let k = 2
        
        let result = MinimumDifferenceBetweenHighestAndLowestOfKScore().minimumDifference(nums, k)
            
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let nums = [87063, 61094, 44530, 21297, 95857, 93551, 9918]
        let k = 6
        
        let result = MinimumDifferenceBetweenHighestAndLowestOfKScore().minimumDifference(nums, k)
            
        XCTAssertEqual(result, 74560)
    }
    
    func test_D() {
        let nums = [93614, 91956, 83384, 14321, 29824, 89095, 96047, 25770, 39895]
        let k = 3
        
        let result = MinimumDifferenceBetweenHighestAndLowestOfKScore().minimumDifference(nums, k)
            
        XCTAssertEqual(result, 4091)
    }
}
