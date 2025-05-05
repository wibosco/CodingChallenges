// Created 05/05/2025.

import Testing

@testable import LeetCode

struct NumberOfDistinctIslandsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let grid = [[1,1,0,0,0],
                    [1,1,0,0,0],
                    [0,0,0,1,1],
                    [0,0,0,1,1]]
        
        let result = NumberOfDistinctIslands().numDistinctIslands(grid)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let grid = [[1,1,0,1,1],
                    [1,0,0,0,0],
                    [0,0,0,0,1],
                    [1,1,0,1,1]]
        
        let result = NumberOfDistinctIslands().numDistinctIslands(grid)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let grid = [[1,1,0],
                    [0,1,1],
                    [0,0,0],
                    [1,1,1],
                    [0,1,0]]
        
        let result = NumberOfDistinctIslands().numDistinctIslands(grid)
        
        #expect(result == 2)
    }
}
