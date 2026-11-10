// Created 10/11/2026.

import Testing

@testable import LeetCode

struct ShortestPathToGetFoodTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let grid: [[Character]] = [
            ["X","X","X","X","X","X"],
            ["X","*","O","O","O","X"],
            ["X","O","O","#","O","X"],
            ["X","X","X","X","X","X"]
        ]
        
        let result = ShortestPathToGetFood().getFood(grid)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let grid: [[Character]] = [
            ["X","X","X","X","X"],
            ["X","*","X","O","X"],
            ["X","O","X","#","X"],
            ["X","X","X","X","X"]
        ]
        
        let result = ShortestPathToGetFood().getFood(grid)
        
        #expect(result == -1)
    }
    
    @Test
    func test_C() {
        let grid: [[Character]] = [
            ["X","X","X","X","X","X","X","X"],
            ["X","*","O","X","O","#","O","X"],
            ["X","O","O","X","O","O","X","X"],
            ["X","O","O","O","O","#","O","X"],
            ["X","X","X","X","X","X","X","X"]
        ]
        
        let result = ShortestPathToGetFood().getFood(grid)
        
        #expect(result == 6)
    }
    
    @Test
    func test_D() {
        let grid: [[Character]] = [
            ["X","X","X","X","X"],
            ["X","*","X","O","X"],
            ["X","O","X","#","X"],
            ["O","O","O","O","O"]
        ]
        
        let result = ShortestPathToGetFood().getFood(grid)
        
        #expect(result == 5)
    }
}
