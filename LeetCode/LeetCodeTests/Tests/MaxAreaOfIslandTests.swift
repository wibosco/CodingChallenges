// Created 10/05/2023.


import XCTest

@testable import LeetCode

final class MaxAreaOfIslandTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                    [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
                    [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]]
        
        let result = MaxAreaOfIsland().maxAreaOfIsland(grid)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let grid = [[0, 0, 0, 0, 0, 0, 0, 0]]
        
        let result = MaxAreaOfIsland().maxAreaOfIsland(grid)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let grid = [[0, 0, 0, 1, 0, 0, 0, 0]]
        
        let result = MaxAreaOfIsland().maxAreaOfIsland(grid)
        
        XCTAssertEqual(result, 1)
    }
}
