// Created 24/02/2024.

import XCTest

@testable import LeetCode

final class CountPairsWhoseSumIsLessThanTargetTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [-1,1,2,3,1]
        let target = 2
        
        let result = CountPairsWhoseSumIsLessThanTarget().countPairs(nums, target)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [-6,2,5,-2,-7,-1,3]
        let target = -2
        
        let result = CountPairsWhoseSumIsLessThanTarget().countPairs(nums, target)
        
        XCTAssertEqual(result, 10)
    }
}
