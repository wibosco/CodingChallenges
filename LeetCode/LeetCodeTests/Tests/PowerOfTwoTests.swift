// Created 10/08/2025.

import Testing

@testable import LeetCode

struct AAPowerOfTwoTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 1
        
        let result = PowerOfTwo().isPowerOfTwo(n)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let n = 16
        
        let result = PowerOfTwo().isPowerOfTwo(n)
        
        #expect(result == true)
    }
    
    @Test
    func test_C() {
        let n = 3
        
        let result = PowerOfTwo().isPowerOfTwo(n)
        
        #expect(result == false)
    }
    
    @Test
    func test_D() {
        let n = -16
        
        let result = PowerOfTwo().isPowerOfTwo(n)
        
        #expect(result == false)
    }
}
