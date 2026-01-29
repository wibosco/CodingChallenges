// Created 04/02/2022.

import XCTest

@testable import LeetCode

final class RunningSumOf1DArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4]
        
        let result = RunningSumOf1DArray().runningSum(nums)
        
        XCTAssertEqual(result, [1, 3, 6, 10])
    }
    
    func test_B() {
        let nums = [1, 1, 1, 1, 1]
        
        let result = RunningSumOf1DArray().runningSum(nums)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 5])
    }
    
    func test_C() {
        let nums = [3, 1, 2, 10, 1]
        
        let result = RunningSumOf1DArray().runningSum(nums)
        
        XCTAssertEqual(result, [3, 4, 6, 16, 17])
    }
}
