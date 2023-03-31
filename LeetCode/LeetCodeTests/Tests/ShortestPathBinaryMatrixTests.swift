//
//  ShortestPathBinaryMatrixTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ShortestPathBinaryMatrixTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let grid = [[0, 1],
                    [1, 0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, 2)
    }
    
    func test_B() {
        let grid = [[0, 0, 0],
                    [1, 1, 0],
                    [1, 1, 0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, 4)
    }
    
    func test_C() {
        let grid = [[1, 0, 0],
                    [1, 1, 0],
                    [1, 1, 0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, -1)
    }
    
    func test_D() {
        let grid = [[0, 0, 1, 0, 0, 0, 1, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0],
                    [1, 1, 1, 0, 0, 0, 0, 1],
                    [1, 0, 0, 1, 0, 1, 1, 0],
                    [0, 0, 0, 0, 0, 1, 1, 0],
                    [1, 0, 0, 0, 0, 1, 1, 0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, 10)
    }
    
    func test_E() {
        let grid = [[0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, 1)
    }
    
    func test_F() {
        let grid = [[0, 0, 0, 0, 1],
                    [1, 0, 0, 0, 0],
                    [0, 1, 0, 1, 0],
                    [0, 0, 0, 1, 1],
                    [0, 0, 0, 1, 0]]
        
        let stepCount = ShortestPathBinaryMatrix.shortestPathBinaryMatrix(grid)
        
        XCTAssertEqual(stepCount, -1)
    }
}
