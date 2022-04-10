//
//  WordSearchTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/03/2022.
//

import XCTest

@testable import LeetCode

class WordSearchTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "ABCCED"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertTrue(exists)
    }
    
    func test_B() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "SEE"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertTrue(exists)
    }
    
    func test_C() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "ABCB"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertFalse(exists)
    }
    
    func test_D() {
        let board: [[Character]] = [["A", "B"]]
        let word = "BA"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertTrue(exists)
    }
    
    func test_E() {
        let board: [[Character]] = [["A", "A"]]
        let word = "AAA"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertFalse(exists)
    }
    
    func test_F() {
        let board: [[Character]] = [["a", "b"],
                                    ["c", "d"]]
        let word = "acdb"
        
        let exists = WordSearch.exist(board, word)
        
        XCTAssertTrue(exists)
    }
}
