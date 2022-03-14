//
//  SpiralMatrixTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/03/2022.
//

import XCTest

@testable import LeetCode

class SpiralMatrixTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let matrix = [[1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9]]
        
        let path = SpiralMatrix.spiralOrder(matrix)
        
        XCTAssertEqual(path, [1, 2, 3, 6, 9, 8, 7, 4, 5])
    }
    
    func test_B() {
        let matrix = [[1, 2, 3, 4],
                      [5, 6, 7, 8],
                      [9, 10, 11, 12]]
        
        let path = SpiralMatrix.spiralOrder(matrix)
        
        XCTAssertEqual(path, [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7])
    }
    
    func test_C() {
        let matrix = [[1, 2, 3, 4],
                      [5, 6, 7, 8],
                      [9, 10, 11, 12],
                      [13, 14, 15, 16]]
        
        let path = SpiralMatrix.spiralOrder(matrix)
        XCTAssertEqual(path, [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10])
    }
}
