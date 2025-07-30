// Created 30/07/2025.

import Testing

@testable import LeetCode

struct FindLuckyIntegerInAnArrayTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let arr = [2,2,3,4]
        
        let result = FindLuckyIntegerInAnArray().findLucky(arr)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let arr = [1,2,2,3,3,3]
        
        let result = FindLuckyIntegerInAnArray().findLucky(arr)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let arr = [2,2,2,3,3]
        
        let result = FindLuckyIntegerInAnArray().findLucky(arr)
        
        #expect(result == -1)
    }
}
