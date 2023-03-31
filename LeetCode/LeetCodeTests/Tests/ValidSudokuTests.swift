//
//  ValidSudokuTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ValidSudokuTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let board: [[Character]] =
        [["5", "3", ".", ".", "7", ".", ".", ".", "."]
        ,["6", ".", ".", "1", "9", "5", ".", ".", "."]
        ,[".", "9", "8", ".", ".", ".", ".", "6", "."]
        ,["8", ".", ".", ".", "6", ".", ".", ".", "3"]
        ,["4", ".", ".", "8", ".", "3", ".", ".", "1"]
        ,["7", ".", ".", ".", "2", ".", ".", ".", "6"]
        ,[".", "6", ".", ".", ".", ".", "2", "8", "."]
        ,[".", ".", ".", "4", "1", "9", ".", ".", "5"]
        ,[".", ".", ".", ".", "8", ".", ".", "7", "9"]]
        
        let isValid = ValidSudoku.isValidSudoku(board)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let board: [[Character]] =
        [["8", "3", ".", ".", "7", ".", ".", ".", "."]
        ,["6", ".", ".", "1", "9", "5", ".", ".", "."]
        ,[".", "9", "8", ".", ".", ".", ".", "6", "."]
        ,["8", ".", ".", ".", "6", ".", ".", ".", "3"]
        ,["4", ".", ".", "8", ".", "3", ".", ".", "1"]
        ,["7", ".", ".", ".", "2", ".", ".", ".", "6"]
        ,[".", "6", ".", ".", ".", ".", "2", "8", "."]
        ,[".", ".", ".", "4", "1", "9", ".", ".", "5"]
        ,[".", ".", ".", ".", "8", ".", ".", "7", "9"]]
        
        let isValid = ValidSudoku.isValidSudoku(board)
        
        XCTAssertFalse(isValid)
    }
    
    func test_C() {
        let board: [[Character]] =
        [[".", ".", ".", ".", ".", ".", "5", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", ".", "."],
         ["9", "3", ".", ".", "2", ".", "4", ".", "."],
         [".", ".", "7", ".", ".", ".", "3", ".", "."],
         [".", ".", ".", ".", ".", ".", ".", ".", "."],
         [".", ".", ".", "3", "4", ".", ".", ".", "."],
         [".", ".", ".", ".", ".", "3", ".", ".", "."],
         [".", ".", ".", ".", ".", "5", "2", ".", "."]]

        let isValid = ValidSudoku.isValidSudoku(board)
        
        XCTAssertFalse(isValid)
    }
}
