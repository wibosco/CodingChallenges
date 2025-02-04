//
//  MinimumNumberOfVerticesToReachAllNodesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/11/2023.
//

import XCTest

@testable import LeetCode

final class MinimumNumberOfVerticesToReachAllNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 6
        let edges = [[0,1],
                     [0,2],
                     [2,5],
                     [3,4],
                     [4,2]]
        
        let result = MinimumNumberOfVerticesToReachAllNodes().findSmallestSetOfVertices(n, edges)
        
        XCTAssertEqual(result, [0, 3])
    }
    
    func test_B() {
        let n = 5
        let edges = [[0,1],
                     [2,1],
                     [3,1],
                     [1,4],
                     [2,4]]
        
        let result = MinimumNumberOfVerticesToReachAllNodes().findSmallestSetOfVertices(n, edges)
        
        XCTAssertEqual(result, [0, 2, 3])
    }
}
