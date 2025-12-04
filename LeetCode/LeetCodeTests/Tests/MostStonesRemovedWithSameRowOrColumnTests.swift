// Created 04/12/2025.

import Testing

@testable import LeetCode

struct MostStonesRemovedWithSameRowOrColumnTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
        
        let result = MostStonesRemovedWithSameRowOrColumn().removeStones(stones)
        
        #expect(result == 5)
    }
    
    @Test
    func test_B() {
        let stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
        
        let result = MostStonesRemovedWithSameRowOrColumn().removeStones(stones)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let stones = [[0,0]]
        
        let result = MostStonesRemovedWithSameRowOrColumn().removeStones(stones)
        
        #expect(result == 0)
    }
    
    @Test
    func test_D() {
        let stones = [[3,2],[3,1],[4,4],[1,1],[0,2],[4,0]]
        
        let result = MostStonesRemovedWithSameRowOrColumn().removeStones(stones)
        
        #expect(result == 4)
    }
}
