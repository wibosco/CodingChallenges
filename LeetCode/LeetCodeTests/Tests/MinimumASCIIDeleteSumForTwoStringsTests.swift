// Created 25/01/2026.

import Testing

@testable import LeetCode

struct MinimumASCIIDeleteSumForTwoStringsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let s1 = "sea"
        let s2 = "eat"
        
        let result = MinimumASCIIDeleteSumForTwoStrings().minimumDeleteSum(s1, s2)
        
        #expect(result == 231)
    }
    
    @Test
    func test_B() {
        let s1 = "delete"
        let s2 = "leet"
        
        let result = MinimumASCIIDeleteSumForTwoStrings().minimumDeleteSum(s1, s2)
        
        #expect(result == 403)
    }
    
    @Test
    func test_C() {
        let s1 = "ccaccjp"
        let s2 = "fwosarcwge"
        
        let result = MinimumASCIIDeleteSumForTwoStrings().minimumDeleteSum(s1, s2)
        
        #expect(result == 1399)
    }
}
