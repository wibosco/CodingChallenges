// Created 05/12/2025.

import Testing

@testable import LeetCode

struct FindSubsequenceOfLengthKWithTheLargestSumTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [2,1,3,3]
        let k = 2
            
        let result = FindSubsequenceOfLengthKWithTheLargestSum().maxSubsequence(nums, k)
        
        #expect(result == [3,3])
    }
    
    @Test
    func test_B() {
        let nums = [-1,-2,3,4]
        let k = 3
            
        let result = FindSubsequenceOfLengthKWithTheLargestSum().maxSubsequence(nums, k)
        
        #expect(result == [-1,3,4])
    }
    
    @Test
    func test_C() {
        let nums = [3,4,3,3]
        let k = 2
            
        let result = FindSubsequenceOfLengthKWithTheLargestSum().maxSubsequence(nums, k)
        
        #expect(result == [3,4])
    }
}
