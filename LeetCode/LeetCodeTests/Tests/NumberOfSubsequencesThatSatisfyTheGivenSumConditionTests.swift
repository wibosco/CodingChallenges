// Created 17/07/2023.

import XCTest

@testable import LeetCode

final class NumberOfSubsequencesThatSatisfyTheGivenSumConditionTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [3, 5, 6, 7]
        let target = 9
        
        let result = NumberOfSubsequencesThatSatisfyTheGivenSumCondition().numSubseq(nums, target)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [3, 3, 6, 8]
        let target = 10
        
        let result = NumberOfSubsequencesThatSatisfyTheGivenSumCondition().numSubseq(nums, target)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_C() {
        let nums = [2, 3, 3, 4, 6, 7]
        let target = 12
        
        let result = NumberOfSubsequencesThatSatisfyTheGivenSumCondition().numSubseq(nums, target)
        
        XCTAssertEqual(result, 61)
    }
}
