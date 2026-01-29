// Created 28/10/2023.

import XCTest

@testable import LeetCode

final class IslandPerimeterTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[0,1,0,0],
                    [1,1,1,0],
                    [0,1,0,0],
                    [1,1,0,0]]
        
        let result = IslandPerimeter().islandPerimeter(grid)
        
        XCTAssertEqual(result, 16)
    }
    
    func test_B() {
        let grid = [[1]]
        
        let result = IslandPerimeter().islandPerimeter(grid)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let grid = [[1,0]]
        
        let result = IslandPerimeter().islandPerimeter(grid)
        
        XCTAssertEqual(result, 4)
    }
}
