//
//  GraphValidTreeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

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
}
