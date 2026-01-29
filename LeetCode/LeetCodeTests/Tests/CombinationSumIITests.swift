// Created 23/02/2022.

import XCTest

@testable import LeetCode

final class CombinationSumIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let candidates = [10, 1, 2, 7, 6, 1, 5]
        let target = 8
        
        let combinations = CombinationSumII().combinationSum2(candidates, target)
        
        let expectedCombinations = [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
    
    func test_B() {
        let candidates = [2, 5, 2, 1, 2]
        let target = 5
        
        let combinations = CombinationSumII().combinationSum2(candidates, target)
        
        let expectedCombinations = [[1, 2, 2], [5]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
}
