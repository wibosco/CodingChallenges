// Created 30/05/2025.

import Testing

@testable import LeetCode

struct MaxConsecutiveOnesIIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,1,1,0,0,0,1,1,1,1,0]
        let k = 2
            
        let result = MaxConsecutiveOnesIII().longestOnes(nums, k)
        
        #expect(result == 6)
    }
    
    @Test
    func test_B() {
        let nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1]
        let k = 3
            
        let result = MaxConsecutiveOnesIII().longestOnes(nums, k)
        
        #expect(result == 10)
    }
    
    @Test
    func test_C() {
        let nums = [0,0,1,1,1,0,0]
        let k = 0
            
        let result = MaxConsecutiveOnesIII().longestOnes(nums, k)
        
        #expect(result == 3)
    }
    
    @Test
    func test_D() {
        let nums = [0,0,0,1]
        let k = 4
            
        let result = MaxConsecutiveOnesIII().longestOnes(nums, k)
        
        #expect(result == 4)
    }
    
    @Test
    func test_E() {
        let nums = [1,1,1,0,0,0,1,1,1,1]
        let k = 0
            
        let result = MaxConsecutiveOnesIII().longestOnes(nums, k)
        
        #expect(result == 4)
    }
}
