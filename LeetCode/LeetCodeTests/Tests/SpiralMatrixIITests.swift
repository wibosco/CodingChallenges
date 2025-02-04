//
//  SpiralMatrixIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/03/2022.
//

import XCTest

@testable import LeetCode

final class SpiralMatrixIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 3
        
        let result = SpiralMatrixII().generateMatrix(n)
        
        XCTAssertEqual(result, [[1, 2, 3], [8, 9, 4], [7, 6, 5]])
    }
    
    func test_B() {
        let n = 1
        
        let result = SpiralMatrixII().generateMatrix(n)
        
        XCTAssertEqual(result, [[1]])
    }
}
