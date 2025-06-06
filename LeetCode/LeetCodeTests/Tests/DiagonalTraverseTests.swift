//
//  DiagonalTraverseTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

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

}
