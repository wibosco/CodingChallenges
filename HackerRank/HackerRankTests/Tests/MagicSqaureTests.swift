// Created 29/10/2021.

import XCTest

@testable import HackerRank

final class MagicSquareTests: XCTestCase {
    // MARK: - Tests
    
    func test_A() {
        let square = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]
        
        let cost = MagicSquare.formingMagicSquare(s: square)
        
        XCTAssertEqual(7, cost)
    }
    
    func test_B() {
        let square = [[4, 9, 2], [3, 5, 7], [8, 1, 5]]
        
        let cost = MagicSquare.formingMagicSquare(s: square)
        
        XCTAssertEqual(1, cost)
    }
    
    func test_C() {
        let square = [[4, 8, 2], [4, 5, 7], [6, 1, 6]]
        
        let cost = MagicSquare.formingMagicSquare(s: square)
        
        XCTAssertEqual(4, cost)
    }
    
    func test_D() {
        let square = [[4, 5, 8], [2, 4, 1], [1, 9, 7]]
        
        let cost = MagicSquare.formingMagicSquare(s: square)
        
        XCTAssertEqual(14, cost)
    }
}
