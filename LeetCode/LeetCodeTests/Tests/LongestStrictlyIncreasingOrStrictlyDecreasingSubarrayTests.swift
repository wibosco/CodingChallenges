// Created 15/11/2026.

import Testing

@testable import LeetCode

struct LongestStrictlyIncreasingOrStrictlyDecreasingSubarrayTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,4,3,3,2]
        
        let result = LongestStrictlyIncreasingOrStrictlyDecreasingSubarray().longestMonotonicSubarray(nums)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let nums = [3,3,3,3]
        
        let result = LongestStrictlyIncreasingOrStrictlyDecreasingSubarray().longestMonotonicSubarray(nums)
        
        #expect(result == 1)
    }
    
    @Test
    func test_C() {
        let nums = [3,2,1]
        
        let result = LongestStrictlyIncreasingOrStrictlyDecreasingSubarray().longestMonotonicSubarray(nums)
        
        #expect(result == 3)
    }
}
