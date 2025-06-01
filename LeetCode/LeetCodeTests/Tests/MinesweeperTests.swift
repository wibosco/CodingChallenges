// Created 31/05/2025.

import Testing

@testable import LeetCode

struct MinesweeperTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let board: [[Character]] = [["E","E","E","E","E"],["E","E","M","E","E"],["E","E","E","E","E"],["E","E","E","E","E"]]
        let click = [3,0]
        
        let result = Minesweeper().updateBoard(board, click)
            
        
        #expect(result == [["B","1","E","1","B"],["B","1","M","1","B"],["B","1","1","1","B"],["B","B","B","B","B"]])
    }
    
    @Test
    func test_B() {
        let board: [[Character]] = [["B","1","E","1","B"],["B","1","M","1","B"],["B","1","1","1","B"],["B","B","B","B","B"]]
        let click = [1,2]
        
        let result = Minesweeper().updateBoard(board, click)
            
        
        #expect(result == [["B","1","E","1","B"],["B","1","X","1","B"],["B","1","1","1","B"],["B","B","B","B","B"]])
    }
}
