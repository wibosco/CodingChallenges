// Created 26/10/2023.


import XCTest

@testable import LeetCode

final class SnakesAndLaddersTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let board = [[-1, -1, -1, -1, -1, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, 35, -1, -1, 13, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, 15, -1, -1, -1, -1]]
        
        let result = SnakesAndLadders().snakesAndLadders(board)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let board = [[-1, -1],
                     [-1, 3]]
        
        let result = SnakesAndLadders().snakesAndLadders(board)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let board = [[1, 1, -1],
                     [1, 1, 1],
                     [-1, 1 ,1]]
        
        let result = SnakesAndLadders().snakesAndLadders(board)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let board = [[-1, -1, 19, 10, -1],
                     [2, -1, -1, 6, -1],
                     [-1, 17, -1, 19, -1],
                     [25, -1, 20, -1, -1],
                     [-1, -1, -1, -1, 15]]
        
        let result = SnakesAndLadders().snakesAndLadders(board)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let board = [[-1, 1, 2, -1],
                     [2, 13, 15, -1],
                     [-1, 10, -1, -1],
                     [-1, 6, 2, 8]]
        
        let result = SnakesAndLadders().snakesAndLadders(board)
        
        XCTAssertEqual(result, 2)
    }
}
