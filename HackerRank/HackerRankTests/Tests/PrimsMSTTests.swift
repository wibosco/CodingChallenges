// Created 28/06/2016.

import XCTest

@testable import HackerRank

final class PrimsMSTTests: XCTestCase {
    
    // MARK: - Tests

    func test_A() {
        
        let totalNodes = 5
        let edges = [[0, 1, 3],
                     [0, 2, 4],
                     [3, 1, 6],
                     [4, 1, 2],
                     [1, 2, 5],
                     [2, 4, 7]]
        let sourceIndex = 0
        
        let totalWeight = PrimsMST.totalWeight(sourceIndex: sourceIndex, totalNodes: totalNodes, edges: edges)
        
        XCTAssertEqual(totalWeight, 15)
    }
}
