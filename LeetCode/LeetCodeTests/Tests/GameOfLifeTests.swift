//
//  GameOfLifeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/04/2022.
//

import XCTest

@testable import LeetCode

final class GameOfLifeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var board = [[0, 1, 0],
                     [0, 0, 1],
                     [1, 1, 1],
                     [0, 0, 0]]
        
        GameOfLife.gameOfLife(&board)
        
        XCTAssertEqual(board, [[0, 0, 0], [1, 0, 1], [0, 1, 1], [0, 1, 0]])
    }
    
    func test_B() {
        var board = [[1, 1],
                     [1, 0]]
        
        GameOfLife.gameOfLife(&board)
        
        XCTAssertEqual(board, [[1, 1], [1, 1]])
    }
}
