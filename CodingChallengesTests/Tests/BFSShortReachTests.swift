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
        let edges = [[0, 1], [0, 2]]
        let sourceIndex = 0
        
        let nodes = BFSShortReach.distanceFromSourceToAllOtherNodes(sourceIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        let distancesFromSource = [0, 6, 6, -1]
        
        for i in 1..<nodes.count {
            
            XCTAssertEqual(nodes[i].distanceFromSource, distancesFromSource[i])
        }
    }
    
    func test_BFSShortRangeB() {
        
        let totalNodes = 3
        let edges = [[1, 2]]
        let sourceIndex = 1
        
        let nodes = BFSShortReach.distanceFromSourceToAllOtherNodes(sourceIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        let distancesFromSource = [-1, 0, 6]
        
        for i in 1..<nodes.count {
            
            XCTAssertEqual(nodes[i].distanceFromSource, distancesFromSource[i])
        }
    }
    
    func test_BFSShortRangeC() {
        
        let totalNodes = 3
        let edges = [[1, 2]]
        let sourceIndex = 1
        
        let nodes = BFSShortReach.distanceFromSourceToAllOtherNodes(sourceIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        let distancesFromSource = [-1, 0, 6]
        
        for i in 1..<nodes.count {
            
            XCTAssertEqual(nodes[i].distanceFromSource, distancesFromSource[i])
        }
    }

}
