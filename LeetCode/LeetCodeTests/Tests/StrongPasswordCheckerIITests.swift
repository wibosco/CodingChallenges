// Created 05/12/2025.

import Testing

@testable import LeetCode

struct StrongPasswordCheckerIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let password = "IloveLe3tcode!"
        
        let result = StrongPasswordCheckerII().strongPasswordCheckerII(password)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let password = "Me+You--IsMyDream"
        
        let result = StrongPasswordCheckerII().strongPasswordCheckerII(password)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let password = "1aB!"
        
        let result = StrongPasswordCheckerII().strongPasswordCheckerII(password)
        
        #expect(result == false)
    }
}
