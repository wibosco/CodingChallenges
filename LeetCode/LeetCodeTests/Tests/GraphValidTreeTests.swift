//
//  GraphValidTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class GraphValidTreeTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let n = 5
        let edges = [[0, 1],
                     [0, 2],
                     [0, 3],
                     [1, 4]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [2, 3],
                     [1, 3],
                     [1, 4]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertFalse(isValid)
    }
    
    func test_C() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [3, 4]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertFalse(isValid)
    }
    
    func test_D() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertFalse(isValid)
    }
    
    func test_E() {
        let n = 2
        let edges = [[1, 0]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertTrue(isValid)
    }
    
    func test_F() {
        let n = 5
        let edges = [[0, 1],
                     [0, 4],
                     [1, 4],
                     [2, 3]]
        
        let isValid = GraphValidTree.validTree(n, edges)
        
        XCTAssertFalse(isValid)
    }
}
