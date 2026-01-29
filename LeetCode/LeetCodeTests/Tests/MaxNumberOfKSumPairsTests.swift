// Created 05/05/2022.

import XCTest

@testable import LeetCode

final class MaxNumberOfKSumPairsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4]
        let k = 5
        
        let result = MaxNumberOfKSumPairs().maxOperations(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [3, 1, 3, 4, 3]
        let k = 6
        
        let result = MaxNumberOfKSumPairs().maxOperations(nums, k)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let nums = [3, 1, 3, 4, 3]
        let k = 9
        
        let result = MaxNumberOfKSumPairs().maxOperations(nums, k)
        
        XCTAssertEqual(result, 0)
    }
}
