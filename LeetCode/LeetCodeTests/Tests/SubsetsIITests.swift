//
//  SubsetsIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/03/2022.
//

import XCTest

@testable import LeetCode

class SubsetsIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 2]
        
        let subsets = SubsetsII.subsetsWithDup(nums)
        
        let expectedSubsets = [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]
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
        
        let subsets = SubsetsII.subsetsWithDup(nums)
        
        let expectedSubsets = [[], [0]]
        var countOfMatches = 0
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedSubsets.count)
    }
    
    func test_C() {
        let nums = [4, 4, 4, 1, 4]
        
        let subsets = SubsetsII.subsetsWithDup(nums)
        
        let expectedSubsets = [[], [1], [1, 4], [1, 4, 4], [1, 4, 4, 4], [1, 4, 4, 4, 4], [4], [4, 4], [4, 4, 4], [4, 4, 4, 4]]
        var countOfMatches = 0
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedSubsets.count)
    }
}
