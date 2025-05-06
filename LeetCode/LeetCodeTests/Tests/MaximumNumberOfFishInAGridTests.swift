// Created 06/05/2025.

import Testing

@testable import LeetCode

struct MaximumNumberOfFishInAGridTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let grid = [[0,2,1,0],
                    [4,0,0,3],
                    [1,0,0,4],
                    [0,3,2,0]]
        
        let result = MaximumNumberOfFishInAGrid().findMaxFish(grid)
        
        #expect(result == 7)
    }
    
    @Test
    func test_B() {
        let grid = [[1,0,0,0],
                    [0,0,0,0],
                    [0,0,0,0],
                    [0,0,0,1]]
        
        let result = MaximumNumberOfFishInAGrid().findMaxFish(grid)
        
        #expect(result == 1)
    }
}
