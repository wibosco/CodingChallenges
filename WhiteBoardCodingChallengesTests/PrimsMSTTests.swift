//
//  PrimsMSTTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class PrimsMSTTests: XCTestCase {
    
    // MARK: Tests

    func test_primsMSTA() {
        
        let totalNodes = 5
        let edges = [[0,1,3],
                     [0,2,4],
                     [3,1,6],
                     [4,1,2],
                     [1,2,5],
                     [2,4,7]]
        let sourceIndex = 0
        
        let totalWeight = PrimsMST.totalWeight(sourceIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(totalWeight, 15)
    }
}
