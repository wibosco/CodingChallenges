// Created 12/05/2025.

import Testing

@testable import LeetCode

struct ClumsyFactorialTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 4
        
        let result = ClumsyFactorial().clumsy(n)
        
        #expect(result == 7)
    }
    
    @Test
    func test_B() {
        let n = 10
        
        let result = ClumsyFactorial().clumsy(n)
        
        #expect(result == 12)
    }
}
