// Created 24/10/2023.

import XCTest

@testable import LeetCode

final class CountSubIslandsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid1 = [[1, 1, 1, 0, 0],
                     [0, 1, 1, 1, 1],
                     [0, 0, 0, 0, 0],
                     [1, 0, 0, 0, 0],
                     [1, 1, 0, 1, 1]]
        
        let grid2 = [[1, 1, 1, 0, 0],
                     [0, 0, 1, 1, 1],
                     [0, 1, 0, 0, 0],
                     [1, 0, 1, 1, 0],
                     [0, 1, 0, 1, 0]]
        
        let result = CountSubIslands().countSubIslands(grid1, grid2)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let grid1 = [[1, 0, 1, 0, 1],
                     [1, 1, 1, 1, 1],
                     [0, 0, 0, 0, 0],
                     [1, 1, 1, 1, 1],
                     [1, 0, 1, 0, 1]]
        
        let grid2 = [[0, 0, 0, 0, 0],
                     [1, 1, 1, 1, 1],
                     [0, 1, 0, 1, 0],
                     [0, 1, 0, 1, 0],
                     [1, 0, 0, 0, 1]]
        
        let result = CountSubIslands().countSubIslands(grid1, grid2)
        
        XCTAssertEqual(result, 2)
    }
}
