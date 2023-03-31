//
//  EvenTreeTests.swift
//  HackerRankTests
//
//  Created by William Boles on 29/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class EvenTreeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let totalNodes = 10
        let edges = [[1,0],
                     [2,0],
                     [3,2],
                     [4,1],
                     [5,0],
                     [6,1],
                     [7,5],
                     [8,7],
                     [9,7]]
        
        let removedEdges = EvenTree.totalEdgesRemovedToFormForestOfEvenTrees(numberOfNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(2, removedEdges)
    }
    
    func test_B() {
        let totalNodes = 30
        let edges = [[1,0],
                     [2,1],
                     [3,2],
                     [4,1],
                     [5,3],
                     [6,3],
                     [7,0],
                     [8,4],
                     [9,3],
                     [10,3],
                     [11,7],
                     [12,1],
                     [13,1],
                     [14,7],
                     [15,9],
                     [16,0],
                     [17,16],
                     [18,17],
                     [19,3],
                     [20,14],
                     [21,19],
                     [22,1],
                     [23,11],
                     [24,20],
                     [25,16],
                     [26,4],
                     [27,26],
                     [28,3],
                     [29,24]]
        
        let removedEdges = EvenTree.totalEdgesRemovedToFormForestOfEvenTrees(numberOfNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(11, removedEdges)
    }
}
