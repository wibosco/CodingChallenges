//
//  FindIfPathExistsInGraphTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindIfPathExistsInGraphTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 3
        let edges = [[0, 1],
                     [1, 2],
                     [2, 0]]
        let start = 0
        let end = 2
        
        let result = FindIfPathExistsInGraph().validPath(n, edges, start, end)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 6
        let edges = [[0, 1],
                     [0, 2],
                     [3, 5],
                     [5, 4],
                     [4, 3]]
        let start = 0
        let end = 5
        
        let result = FindIfPathExistsInGraph().validPath(n, edges, start, end)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 1
        let edges = [[Int]]()
        let start = 0
        let end = 0
        
        let result = FindIfPathExistsInGraph().validPath(n, edges, start, end)
        
        XCTAssertTrue(result)
    }
}
