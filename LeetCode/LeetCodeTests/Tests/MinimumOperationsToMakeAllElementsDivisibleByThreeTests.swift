// Created 17/01/2026.

import Testing

@testable import LeetCode

struct MinimumOperationsToMakeAllElementsDivisibleByThreeTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,2,3,4]
        
        let result = MinimumOperationsToMakeAllElementsDivisibleByThree().minimumOperations(nums)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let nums = [3,6,9]
        
        let result = MinimumOperationsToMakeAllElementsDivisibleByThree().minimumOperations(nums)
        
        #expect(result == 0)
    }
}
