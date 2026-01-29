// Created 17/03/2022.

import XCTest

@testable import LeetCode

final class CombinationsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 4
        let k = 2
        
        let combinations = Combinations().combine(n, k)
        
        let expectedCombinations = [[2, 4], [3, 4], [2, 3], [1, 2], [1, 3], [1, 4]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
    
    func test_B() {
        let n = 1
        let k = 1
        
        let combinations = Combinations().combine(n, k)
        
        let expectedCombinations = [[1]]
        
        //order isn't important
        for combination in combinations {
            XCTAssertTrue(expectedCombinations.contains(combination))
        }
        
        XCTAssertEqual(combinations.count, expectedCombinations.count)
    }
}
