// Created 08/05/2016.

import XCTest

@testable import HackerRank

final class SherlockSquaresTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 3, upperBoundary: 9)
        
        XCTAssertEqual(2, count)
    }
    
    func test_B() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 17, upperBoundary: 24)
        
        XCTAssertEqual(0, count)
    }
    
    func test_C() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 3, upperBoundary: 16)
        
        XCTAssertEqual(3, count)
    }
    
    func test_D() {
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 150336667, upperBoundary: 828238028)
        
        XCTAssertEqual(16518, count)
    }
    
}
