// Created 02/11/2023.


import XCTest

@testable import LeetCode

final class NumberOfEnclavesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[0,0,0,0],
                    [1,0,1,0],
                    [0,1,1,0],
                    [0,0,0,0]]
        
        let result = NumberOfEnclaves().numEnclaves(grid)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let grid = [[0,1,1,0],
                    [0,0,1,0],
                    [0,0,1,0],
                    [0,0,0,0]]
        
        let result = NumberOfEnclaves().numEnclaves(grid)
        
        XCTAssertEqual(result, 0)
    }
}
