// Created 04/05/2025.

import Testing

@testable import LeetCode

struct NumberOfEquivalentDominoPairsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let dominoes = [[1,2],[2,1],[3,4],[5,6]]
        
        let result = NumberOfEquivalentDominoPairs().numEquivDominoPairs(dominoes)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let dominoes = [[1,2],[1,2],[1,1],[1,2],[2,2]]
        
        let result = NumberOfEquivalentDominoPairs().numEquivDominoPairs(dominoes)
        
        #expect(result == 3)
    }
}
