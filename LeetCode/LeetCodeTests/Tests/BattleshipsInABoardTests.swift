// Created 05/05/2025.

import Testing

@testable import LeetCode

struct BattleshipsInABoardTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let board: [[Character]] = [["X",".",".","X"],
                                    [".",".",".","X"],
                                    [".",".",".","X"]]
        
        let result = BattleshipsInABoard().countBattleships(board)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let board: [[Character]] = [["."]]
        
        let result = BattleshipsInABoard().countBattleships(board)
        
        #expect(result == 0)
    }
}
