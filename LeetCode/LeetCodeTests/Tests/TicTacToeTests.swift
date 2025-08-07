// Created 07/08/2025.

import Testing

@testable import LeetCode

struct TicTacToeTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let game = TicTacToe(3)
        
        #expect(game.move(0, 0, 1) == 0)
        #expect(game.move(0, 2, 2) == 0)
        #expect(game.move(2, 2, 1) == 0)
        #expect(game.move(1, 1, 2) == 0)
        #expect(game.move(2, 0, 1) == 0)
        #expect(game.move(1, 0, 2) == 0)
        #expect(game.move(2, 1, 1) == 1)
    }
}
