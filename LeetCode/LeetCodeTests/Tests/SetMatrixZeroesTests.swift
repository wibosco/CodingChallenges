//
//  SetMatrixZeroesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/03/2022.
//

import XCTest

@testable import LeetCode

class SetMatrixZeroesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
        
        SetMatrixZeroes.setZeroes(&matrix)
        
        XCTAssertEqual(matrix, [[1, 0, 1], [0, 0, 0], [1, 0, 1]])
    }
    
    func test_B() {
        var matrix = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
        
        SetMatrixZeroes.setZeroes(&matrix)
        
        XCTAssertEqual(matrix, [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]])
    }
}
