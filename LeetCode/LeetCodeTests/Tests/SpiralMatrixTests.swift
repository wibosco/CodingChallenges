// Created 13/03/2022.

import XCTest

@testable import LeetCode

final class SpiralMatrixTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let matrix = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        
        let result = SpiralMatrix().spiralOrder(matrix)
        
        XCTAssertEqual(result, [1, 2, 3, 6, 9, 8, 7, 4, 5])
    }
    
    func test_B() {
        let matrix = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12]
        ]
        
        let result = SpiralMatrix().spiralOrder(matrix)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7])
    }
    
    func test_C() {
        let matrix = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
        ]
        
        let result = SpiralMatrix().spiralOrder(matrix)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10])
    }
    
    func test_D() {
        let matrix = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13 ,14, 15, 16],
            [17 ,18, 19, 20],
            [21 ,22, 23, 24]
        ]
        
        let result = SpiralMatrix().spiralOrder(matrix)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 8, 12, 16, 20, 24, 23, 22, 21, 17, 13, 9, 5, 6, 7, 11, 15, 19, 18, 14, 10])
    }
}
