// Created 17/03/2022.

import XCTest

@testable import LeetCode

final class SubsetsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3]
        
        let subsets = Subsets().subsets(nums)
        
        let expectedSubsets = [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
        }
        
        XCTAssertEqual(subsets.count, expectedSubsets.count)
    }
    
    func test_B() {
        let nums = [0]
        
        let subsets = Subsets().subsets(nums)
        
        let expectedSubsets = [[], [0]]
        
        //order isn't important
        for subset in subsets {
            XCTAssertTrue(expectedSubsets.contains(subset))
        }
        
        XCTAssertEqual(subsets.count, expectedSubsets.count)
    }
}
