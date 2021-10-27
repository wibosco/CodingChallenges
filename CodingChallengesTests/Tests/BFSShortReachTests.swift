//
//  BFSShortReachTests.swift
//  CodingChallenges
//
//  Created by William Boles on 24/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BFSShortReachTests: XCTestCase {

    // MARK: - Tests
    
    func test_BFSShortRangeA() {
        let totalNodes = 4
        let edges = [[1, 2], [1, 3]]
        let sourceIndex = 1
        
        let distances = BFSShortReach().distanceFromSourceToAllOtherNodes(startingIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(distances, [6, 6, -1])
    }
    
    func test_BFSShortRangeB() {
        let totalNodes = 3
        let edges = [[2, 3]]
        let sourceIndex = 2
        
        let distances = BFSShortReach().distanceFromSourceToAllOtherNodes(startingIndex: sourceIndex, totalNodes: totalNodes, edges: edges)

        XCTAssertEqual(distances, [-1, 6])
    }
    
    func test_BFSShortRangeC() {
        let totalNodes = 5
        let edges = [[1, 2], [1, 3], [3, 4]]
        let sourceIndex = 1
        
        let distances = BFSShortReach().distanceFromSourceToAllOtherNodes(startingIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(distances, [6, 6, 12, -1])
    }
}
