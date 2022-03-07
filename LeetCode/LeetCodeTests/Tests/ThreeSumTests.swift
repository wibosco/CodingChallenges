//
//  ThreeSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/03/2022.
//

import XCTest

@testable import LeetCode

class ThreeSumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-1, 0, 1, 2, -1, -4]
        
        let triplets = ThreeSum.threeSum(nums)
        
        let expectedTriplets = [[-1, -1, 2], [-1, 0, 1]]
        var countOfMatches = 0
        
        //order of subarrays isn't important
        for triplet in triplets {
            XCTAssertTrue(expectedTriplets.contains(triplet))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedTriplets.count)
    }
    
    func test_B() {
        let nums = [Int]()
        
        let triplets = ThreeSum.threeSum(nums)
        
        XCTAssertEqual(triplets, [[Int]]())
    }
    
    func test_C() {
        let nums = [0]
        
        let triplets = ThreeSum.threeSum(nums)
        
        XCTAssertEqual(triplets, [[Int]]())
    }
}
