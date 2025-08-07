// Created 07/08/2025.

import Testing

@testable import LeetCode

struct FruitsIntoBasketsIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let fruits = [4,2,5]
        let baskets = [3,5,4]
            
        let result = FruitsIntoBasketsII().numOfUnplacedFruits(fruits, baskets)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let fruits = [3,6,1]
        let baskets = [6,4,7]
            
        let result = FruitsIntoBasketsII().numOfUnplacedFruits(fruits, baskets)
        
        #expect(result == 0)
    }
}
