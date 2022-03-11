//
//  DetermineWhetherMatrixCanBeObtainedByRotationTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/03/2022.
//

import XCTest

@testable import LeetCode

class DetermineWhetherMatrixCanBeObtainedByRotationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mat = [[0, 1], [1, 0]]
        let target = [[1, 0], [0, 1]]
        
        let isEqual = DetermineWhetherMatrixCanBeObtainedByRotation.findRotation(mat, target)
        
        XCTAssertTrue(isEqual)
    }
    
    func test_B() {
        let mat = [[0, 1], [1, 1]]
        let target = [[1, 0], [0, 1]]
        
        let isEqual = DetermineWhetherMatrixCanBeObtainedByRotation.findRotation(mat, target)
        
        XCTAssertFalse(isEqual)
    }
    
    func test_C() {
        let mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
        let target = [[1, 1, 1], [0, 1, 0], [0, 0, 0]]
        
        let isEqual = DetermineWhetherMatrixCanBeObtainedByRotation.findRotation(mat, target)
        
        XCTAssertTrue(isEqual)
    }
    
    func test_D() {
        let mat = [[0, 0, 0], [0, 0, 1], [0, 0, 1]]
        let target = [[0, 0, 0], [0, 0, 1], [0, 0, 1]]
        
        let isEqual = DetermineWhetherMatrixCanBeObtainedByRotation.findRotation(mat, target)
        
        XCTAssertTrue(isEqual)
    }
}
