// Created 12/08/2025.

import Testing

@testable import LeetCode

struct RearrangingFruitsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let basket1 = [4,2,2,2]
        let basket2 = [1,4,1,2]
            
        let result = RearrangingFruits().minCost(basket1, basket2)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let basket1 = [2,3,4,1]
        let basket2 = [3,2,5,1]
            
        let result = RearrangingFruits().minCost(basket1, basket2)
        
        #expect(result == -1)
    }
}
