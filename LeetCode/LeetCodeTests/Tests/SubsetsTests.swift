//
//  SubsetsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/03/2022.
//

import XCTest

@testable import LeetCode

class SubsetsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3]
        
        let subsets = Subsets.subsets(nums)
        
        let expectedSubsets = [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
        var countOfMatches = 0
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedSubsets.count)
    }
    
    func test_B() {
        let nums = [0]
        
        let subsets = Subsets.subsets(nums)
        
        let expectedSubsets = [[], [0]]
        var countOfMatches = 0
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedSubsets.count)
    }
}
