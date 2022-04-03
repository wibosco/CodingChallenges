//
//  IsGraphBipartiteTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/04/2022.
//

import XCTest

@testable import LeetCode

class IsGraphBipartiteTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let graph = [[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]]
        
        let isBipartite = IsGraphBipartite.isBipartite(graph)
        
        XCTAssertFalse(isBipartite)
    }
    
    func test_B() {
        let graph = [[1, 3], [0, 2], [1, 3], [0, 2]]
        
        let isBipartite = IsGraphBipartite.isBipartite(graph)
        
        XCTAssertTrue(isBipartite)
    }
}
