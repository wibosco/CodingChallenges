//
//  CombinationSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/02/2022.
//

import XCTest

@testable import LeetCode

class CombinationSumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let candidates = [2, 3, 6, 7]
        let target = 7
        
        let combinations = CombinationSum.combinationSum(candidates, target)
        
        let expectedCombinations = [[2, 2, 3], [7]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
    
    func test_B() {
        let candidates = [2, 3, 5]
        let target = 8
        
        let combinations = CombinationSum.combinationSum(candidates, target)
        
        let expectedCombinations = [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
    
    func test_C() {
        let candidates = [2]
        let target = 1
        
        let combinations = CombinationSum.combinationSum(candidates, target)
        
        let expectedCombinations = [[Int]]()
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
}
