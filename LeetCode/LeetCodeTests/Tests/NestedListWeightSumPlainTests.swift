// Created 01/09/2025.

import Testing

@testable import LeetCode

struct AANestedListWeightSumPlainTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nestedList = "[[1,1],2,[1,1]]"
        
        let result = NestedListWeightSumPlain().depthSum(nestedList)
        
        #expect(result == 10)
    }
    
    @Test
    func test_B() {
        let nestedList = "[1,[4,[6]]]"
        
        let result = NestedListWeightSumPlain().depthSum(nestedList)
        
        #expect(result == 27)
    }
}
