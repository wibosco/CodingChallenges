//
//  CloneGraphTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class CloneGraphTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let adjList = [[2, 4],
                       [1, 3],
                       [2, 4],
                       [1, 3]]
        
        let graph = GraphVertice.createUndirectedGraph(fromAdjList: adjList)
        
        let deepCopy = CloneGraph.cloneGraph(graph)
        
        let values = GraphVertice.extractValuesIntoAdjList(fromGraph: deepCopy)
        
        XCTAssertEqual(values, [[2, 4], [1, 3], [2, 4], [1, 3]])
    }
    
    func test_B() {
        let adjList = [[2],
                       [1]]
        
        let graph = GraphVertice.createUndirectedGraph(fromAdjList: adjList)
        
        let deepCopy = CloneGraph.cloneGraph(graph)
        
        let values = GraphVertice.extractValuesIntoAdjList(fromGraph: deepCopy)
        
        XCTAssertEqual(values, [[2], [1]])
    }
    
    func test_C() {
        let adjList = [[2, 3, 4],
                       [1, 7],
                       [1],
                       [1, 5, 6, 8],
                       [4],
                       [4],
                       [2],
                       [4]]
        
        let graph = GraphVertice.createUndirectedGraph(fromAdjList: adjList)
        
        let deepCopy = CloneGraph.cloneGraph(graph)
        
        let values = GraphVertice.extractValuesIntoAdjList(fromGraph: deepCopy)
        
        XCTAssertEqual(values, [[2, 3, 4], [1, 7], [1], [1, 5, 6, 8], [4], [4], [2], [4]])
    }
}
