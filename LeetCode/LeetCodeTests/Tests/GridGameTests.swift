//
//  GridGameTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/07/2023.
//

import XCTest

@testable import LeetCode

final class GridGameTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[2, 5, 4],
                    [1, 5, 1]]
        
        let result = GridGame().gridGame(grid)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let grid = [[3, 3, 1],
                    [8, 5, 2]]
        
        let result = GridGame().gridGame(grid)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let grid = [[1, 3, 1, 15],
                    [1, 3, 3, 1]]
        
        let result = GridGame().gridGame(grid)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_D() {
        let grid = [[20, 3,  20, 17, 2,  12, 15, 17, 4,  15],
                    [20, 10, 13, 14, 15, 5,  2,  3,  14, 3]]
        
        let result = GridGame().gridGame(grid)
        
        XCTAssertEqual(result, 63)
    }
}
