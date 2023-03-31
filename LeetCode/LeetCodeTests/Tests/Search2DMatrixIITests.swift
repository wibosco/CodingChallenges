//
//  Search2DMatrixIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class Search2DMatrixIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let matrix = [[1, 4, 7, 11, 15],
                      [2, 5, 8, 12, 19],
                      [3, 6, 9, 16, 22],
                      [10, 13, 14, 17, 24],
                      [18, 21, 23, 26, 30]]
        let target = 5
        
        let exists = Search2DMatrixII.searchMatrix(matrix, target)
        
        XCTAssertTrue(exists)
    }
    
    func test_B() {
        let matrix = [[1, 4, 7, 11, 15],
                      [2, 5, 8, 12, 19],
                      [3, 6, 9, 16, 22],
                      [10, 13, 14, 17, 24],
                      [18, 21, 23, 26, 30]]
        let target = 20
        
        let exists = Search2DMatrixII.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_C() {
        let matrix = [[-1],
                      [-1]]
        let target = 0
        
        let exists = Search2DMatrixII.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_D() {
        let matrix = [[1, 1]]
        let target = 0
        
        let exists = Search2DMatrixII.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
}
