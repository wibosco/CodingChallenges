//
//  ToeplitzMatrixTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ToeplitzMatrixTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let matrix = [[1, 2, 3, 4],
                      [5, 1, 2, 3],
                      [9, 5, 1, 2]]
        
        let result = ToeplitzMatrix().isToeplitzMatrix(matrix)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let matrix = [[1, 2],
                      [2, 2]]
        
        let result = ToeplitzMatrix().isToeplitzMatrix(matrix)
        
        XCTAssertFalse(result)
    }

}
