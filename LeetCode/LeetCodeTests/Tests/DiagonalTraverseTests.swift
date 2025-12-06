// Created 01/01/2022.


import XCTest

@testable import LeetCode

final class DiagonalTraverseTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mat = [[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]]
        
        let result = DiagonalTraverse().findDiagonalOrder(mat)
        
        XCTAssertEqual(result, [1, 2, 4, 7, 5, 3, 6, 8, 9])
    }
    
    func test_B() {
        let mat = [[1, 2],
                   [3, 4]]
        
        let result = DiagonalTraverse().findDiagonalOrder(mat)
        
        XCTAssertEqual(result, [1, 2, 3, 4])
    }
    
    func test_C() {
        let mat = [[1,2,3,4,5],
                   [6,7,8,9,10],
                   [11,12,13,14,15],
                   [16,17,18,19,20],
                   [21,22,23,24,25]]
        
        let result = DiagonalTraverse().findDiagonalOrder(mat)
        
        XCTAssertEqual(result, [1, 2, 6, 11, 7, 3, 4, 8, 12, 16, 21, 17, 13, 9, 5, 10, 14, 18, 22, 23, 19, 15, 20, 24, 25])
    }

}
