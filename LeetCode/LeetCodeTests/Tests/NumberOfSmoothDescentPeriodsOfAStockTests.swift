// Created 14/01/2026.

import Testing

@testable import LeetCode

struct NumberOfSmoothDescentPeriodsOfAStockTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let prices = [3,2,1,4]
        
        let result = NumberOfSmoothDescentPeriodsOfAStock().getDescentPeriods(prices)
        
        #expect(result == 7)
    }
    
    @Test
    func test_B() {
        let prices = [8,6,7,7]
        
        let result = NumberOfSmoothDescentPeriodsOfAStock().getDescentPeriods(prices)
        
        #expect(result == 4)
    }
    
    @Test
    func test_C() {
        let prices = [1]
        
        let result = NumberOfSmoothDescentPeriodsOfAStock().getDescentPeriods(prices)
        
        #expect(result == 1)
    }
}
