//
//  LeftmostColumnWithAtLeastAOneTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/04/2022.
//

import XCTest

@testable import LeetCode

final class LeftmostColumnWithAtLeastAOneTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mat = [[0, 0], [1, 1]]
        let binaryMatrix = BinaryMatrix(mat)
        
        let result = LeftmostColumnWithAtLeastAOne().leftMostColumnWithOne(binaryMatrix)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_B() {
        let mat = [[0, 0], [0, 1]]
        let binaryMatrix = BinaryMatrix(mat)
        
        let result = LeftmostColumnWithAtLeastAOne().leftMostColumnWithOne(binaryMatrix)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let mat = [[0, 0], [0, 0]]
        let binaryMatrix = BinaryMatrix(mat)
        
        let result = LeftmostColumnWithAtLeastAOne().leftMostColumnWithOne(binaryMatrix)
        
        XCTAssertEqual(result, -1)
    }
}
