//
//  Search2DMatrixTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class Search2DMatrixTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let matrix = [[1, 3, 5, 7],
                      [10, 11, 16, 20],
                      [23, 30, 34, 60]]
        let target = 3
        
        let exists = Search2DMatrix.searchMatrix(matrix, target)
        
        XCTAssertTrue(exists)
    }
    
    func test_B() {
        let matrix = [[1, 3, 5, 7],
                      [10, 11, 16, 20],
                      [23, 30, 34, 60]]
        let target = 13
        
        let exists = Search2DMatrix.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_C() {
        let matrix = [[1]]
        let target = 0
        
        let exists = Search2DMatrix.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
    
    func test_D() {
        let matrix = [[1, 1]]
        let target = 0
        
        let exists = Search2DMatrix.searchMatrix(matrix, target)
        
        XCTAssertFalse(exists)
    }
}
