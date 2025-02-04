//
//  SortTheMatrixDiagonallyTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/04/2022.
//

import XCTest

@testable import LeetCode

final class SortTheMatrixDiagonallyTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let mat = [[3, 3, 1, 1],
                   [2, 2, 1, 2],
                   [1, 1, 1, 2]]
        
        let result = SortTheMatrixDiagonally().diagonalSort(mat)
        
        XCTAssertEqual(result, [[1, 1, 1, 1],
                                [1, 2, 2, 2],
                                [1, 2, 3, 3]])
    }
    
    func test_B() {
        let mat = [[11, 25, 66, 1, 69, 7],
                   [23, 55, 17, 45, 15, 52],
                   [75, 31, 36, 44, 58, 8],
                   [22, 27, 33, 25, 68, 4],
                   [84, 28, 14, 11, 5, 50]]
        
        let result = SortTheMatrixDiagonally().diagonalSort(mat)
        
        XCTAssertEqual(result, [[5, 17, 4, 1, 52, 7],
                                [11, 11, 25, 45, 8, 69],
                                [14, 23, 25, 44, 58, 15],
                                [22, 27, 31, 36, 50, 66],
                                [84, 28, 75, 33, 55, 68]])
    }
}
