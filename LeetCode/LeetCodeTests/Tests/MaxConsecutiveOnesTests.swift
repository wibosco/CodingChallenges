// Created 31/08/2025.

import Testing

@testable import LeetCode

struct MaxConsecutiveOnesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,1,0,1,1,1]
        
        let result = MaxConsecutiveOnes().findMaxConsecutiveOnes(nums)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let nums = [1,0,1,1,0,1]
        
        let result = MaxConsecutiveOnes().findMaxConsecutiveOnes(nums)
        
        #expect(result == 2)
    }
}
