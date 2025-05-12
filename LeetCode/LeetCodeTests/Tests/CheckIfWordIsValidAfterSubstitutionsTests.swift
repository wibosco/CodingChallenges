// Created 12/05/2025.

import Testing

@testable import LeetCode

struct CheckIfWordIsValidAfterSubstitutionsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s = "aabcbc"
        
        let result = CheckIfWordIsValidAfterSubstitutions().isValid(s)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let s = "abcabcababcc"
        
        let result = CheckIfWordIsValidAfterSubstitutions().isValid(s)
        
        #expect(result == true)
    }
    
    @Test
    func test_C() {
        let s = "abccba"
        
        let result = CheckIfWordIsValidAfterSubstitutions().isValid(s)
        
        #expect(result == false)
    }
    
    @Test
    func test_D() {
        let s = "aaabc"
        
        let result = CheckIfWordIsValidAfterSubstitutions().isValid(s)
        
        #expect(result == false)
    }
}
