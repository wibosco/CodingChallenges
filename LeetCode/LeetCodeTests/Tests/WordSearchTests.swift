// Created 18/03/2022.

import XCTest

@testable import LeetCode

final class WordSearchTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "ABCCED"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "SEE"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let board: [[Character]] = [["A", "B", "C", "E"],
                                    ["S", "F", "C", "S"],
                                    ["A", "D", "E", "E"]]
        let word = "ABCB"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let board: [[Character]] = [["A", "B"]]
        let word = "BA"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let board: [[Character]] = [["A", "A"]]
        let word = "AAA"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertFalse(result)
    }
    
    func test_F() {
        let board: [[Character]] = [["a", "b"],
                                    ["c", "d"]]
        let word = "acdb"
        
        let result = WordSearch().exist(board, word)
        
        XCTAssertTrue(result)
    }
}
