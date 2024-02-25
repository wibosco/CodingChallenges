//
//  TheKWeakestRowsInAMatrixTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/02/2024.
//

import XCTest

@testable import LeetCode

final class TheKWeakestRowsInAMatrixTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let mat = [[1,1,0,0,0],
                   [1,1,1,1,0],
                   [1,0,0,0,0],
                   [1,1,0,0,0],
                   [1,1,1,1,1]]
        
        let k = 3
        
        let result = TheKWeakestRowsInAMatrix().kWeakestRows(mat, k)
        
        XCTAssertEqual(result, [2,0,3])
    }
    
    func test_B() {
        let mat = [[1,0,0,0],
                   [1,1,1,1],
                   [1,0,0,0],
                   [1,0,0,0]]
        let k = 2
        
        let result = TheKWeakestRowsInAMatrix().kWeakestRows(mat, k)
        
        XCTAssertEqual(result, [0,2])
    }
    
    func test_C() {
        let mat = [[1,0,0,0],
                   [1,1,1,1],
                   [0,0,0,0],
                   [1,0,0,0]]
        let k = 2
        
        let result = TheKWeakestRowsInAMatrix().kWeakestRows(mat, k)
        
        XCTAssertEqual(result, [2,0])
    }
}
