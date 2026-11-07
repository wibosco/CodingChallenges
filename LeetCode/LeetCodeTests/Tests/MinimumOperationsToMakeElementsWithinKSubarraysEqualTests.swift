// Created 07/11/2026.

import Testing

@testable import LeetCode

struct MinimumOperationsToMakeElementsWithinKSubarraysEqualTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [5,-2,1,3,7,3,6,4,-1]
        let x = 3
        let k = 2
        
        let result = MinimumOperationsToMakeElementsWithinKSubarraysEqual().minOperations(nums, x, k)
        
        #expect(result == 8)
    }
    
    @Test
    func test_B() {
        let nums = [9,-2,-2,-2,1,5]
        let x = 2
        let k = 2
        
        let result = MinimumOperationsToMakeElementsWithinKSubarraysEqual().minOperations(nums, x, k)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let nums = [17,-1]
        let x = 2
        let k = 1
        
        let result = MinimumOperationsToMakeElementsWithinKSubarraysEqual().minOperations(nums, x, k)
        
        #expect(result == 18)
    }
}
