//
//  CheckIfMoveIsLegalTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/10/2023.
//

import XCTest

@testable import LeetCode

final class CheckIfMoveIsLegalTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let board: [[Character]] = [[".",".",".","B",".",".",".","."],
                                    [".",".",".","W",".",".",".","."],
                                    [".",".",".","W",".",".",".","."],
                                    [".",".",".","W",".",".",".","."],
                                    ["W","B","B",".","W","W","W","B"],
                                    [".",".",".","B",".",".",".","."],
                                    [".",".",".","B",".",".",".","."],
                                    [".",".",".","W",".",".",".","."]]
        let rMove = 4
        let cMove = 3
        let color: Character = "B"
        
        let result = CheckIfMoveIsLegal.checkMove(board, rMove, cMove, color)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let board: [[Character]] = [[".",".",".",".",".",".",".","."],
                                    [".","B",".",".","W",".",".","."],
                                    [".",".","W",".",".",".",".","."],
                                    [".",".",".","W","B",".",".","."],
                                    [".",".",".",".",".",".",".","."],
                                    [".",".",".",".","B","W",".","."],
                                    [".",".",".",".",".",".","W","."],
                                    [".",".",".",".",".",".",".","B"]]
        let rMove = 4
        let cMove = 4
        let color: Character = "W"
        
        let result = CheckIfMoveIsLegal.checkMove(board, rMove, cMove, color)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let board: [[Character]] = [[".",".","W",".","B","W","W","B"],
                                    ["B","W",".","W",".","W","B","B"],
                                    [".","W","B","W","W",".","W","W"],
                                    ["W","W",".","W",".",".","B","B"],
                                    ["B","W","B","B","W","W","B","."],
                                    ["W",".","W",".",".","B","W","W"],
                                    ["B",".","B","B",".",".","B","B"],
                                    [".","W",".","W",".","W",".","W"]]
        let rMove = 5
        let cMove = 4
        let color: Character = "W"
        
        let result = CheckIfMoveIsLegal.checkMove(board, rMove, cMove, color)
        
        XCTAssertTrue(result)
    }
}
