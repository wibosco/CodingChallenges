// Created 02/04/2023.

import XCTest

@testable import LeetCode

final class LongestIncreasingSubsequenceTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [10, 9, 2, 5, 3, 7, 101, 18]
            
        let result = LongestIncreasingSubsequence().lengthOfLIS(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [0, 1, 0, 3, 2, 3]
            
        let result = LongestIncreasingSubsequence().lengthOfLIS(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let nums = [7, 7, 7, 7, 7, 7, 7]
            
        let result = LongestIncreasingSubsequence().lengthOfLIS(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let nums = [3, 5, 6, 2, 5, 4, 19, 5, 6, 7, 12]
            
        let result = LongestIncreasingSubsequence().lengthOfLIS(nums)
        
        XCTAssertEqual(result, 6)
    }
}
