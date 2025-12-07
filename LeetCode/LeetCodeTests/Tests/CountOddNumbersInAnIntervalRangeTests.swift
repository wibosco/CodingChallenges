// Created 07/12/2025.

import Testing

@testable import LeetCode

struct CountOddNumbersInAnIntervalRangeTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let low = 3
        let high = 7
            
        let result = CountOddNumbersInAnIntervalRange().countOdds(low, high)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let low = 8
        let high = 10
            
        let result = CountOddNumbersInAnIntervalRange().countOdds(low, high)
        
        #expect(result == 1)
    }
}
