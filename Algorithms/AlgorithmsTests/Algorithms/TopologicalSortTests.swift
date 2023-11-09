//
//  TopologicalSortTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 25/05/2022.
//

import XCTest

@testable import Algorithms

final class TopologicalSortTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: Sort
    
    func test_sort_noCycle_singleGraph() {
        //Graph:
        // 
        // +---+     +---+     +---+
        // | 0 +---->| 1 +---->| 2 |
        // +---+     +---+     +---+
        //
        
        let adjList = [[1], [2], []]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertEqual(sorted, [0, 1, 2])
    }
    
    func test_sort_cycle_singleGraph() {
        //Graph:
        //
        //            +--------+
        //            |        v
        // +---+    +-+-+    +---+
        // | 0 +--->| 1 |<---+ 2 |
        // +---+    +---+    +---+
        //
        
        let adjList = [[1], [2], [1]]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertNil(sorted)
    }
    
    func test_sort_cycle_selfReferral_singleGraph() {
        //Graph:
        //
        //            +-----+
        //            |     |
        // +---+    +-+-+   |   +---+
        // | 0 +--->| 1 |<--+   | 2 |
        // +---+    +---+       +---+
        //
        
        let adjList = [[1], [1], []]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertNil(sorted)
    }
    
    func test_sort_noCycle_multipleGraph() {
        //Graph:
        //
        // +---+    +---+    +---+
        // | 0 +--->| 1 +--->| 2 |
        // +---+    +---+    +---+
        //
        // +---+    +---+
        // | 3 +--->| 4 |
        // +---+    +---+
        //
        
        let adjList = [[1], [2], [], [4], []]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertEqual(sorted, [3, 4, 0, 1, 2])
    }
    func test_sort_noCycle_complex_multipleGraph_A() {
        //Graph:
        //
        // +---+    +---+          +---+
        // | 0 +--->| 1 |          | 8 |
        // +---+    +---+          +---+
        //            ^
        //            |
        //          +-+-+    +---+    +---+    +---+
        //          | 2 +--->| 3 +--->| 4 +--->| 5 |
        //          +---+    +---+    +---+    +---+
        //                     ^                 ^
        //                     |                 |
        //                   +-+-+             +-+-+
        //                   | 6 +------------>| 7 |
        //                   +---+             +---+
        
        let adjList = [[1], [], [1, 3], [4], [5], [], [3, 7], [5], []]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertEqual(sorted, [8, 6, 7, 2, 3, 4, 5, 0, 1])
    }
    
    func test_sort_noCycle_complex_multipleGraph_B() {
        //Graph:
        //            +---------------------+
        //            |                     |
        // +---+    +-+-+    +---+          |
        // | 0 |    | 1 |    | 2 +-----+    |
        // +---+    +---+    +---+     |    |
        //   |        |        |       |    |
        //   +--+   +-+        |       |    |
        //      |   |          |       |    |
        //      v   v          |       v    |
        //      +---+          |     +---+  |
        //   +--+ 3 +------+   |     | 4 |<-+
        //   |  +-+-+      |   |     +-+-+
        //   |    |        |   |       |
        //   |    |        |   |       |
        //   v    |        |   v       |
        // +---+  | +---+  | +---+     |
        // | 5 |  +>| 6 |  +>| 7 |     |
        // +---+    +---+    +---+     |
        //            ^                |
        //            |                |
        //            +----------------+
        //
        
        let adjList = [[3], [3, 4], [4, 7], [5, 6, 7], [6], [], [], []]
        
        let sorted = TopologicalSort.sort(adjList)
        
        XCTAssertEqual(sorted, [2, 1, 4, 0, 3, 7, 6, 5])
    }
    
    // MARK: IsDAG
    
    func test_isDAG_noCycle_singleGraph() {
        //Graph:
        //
        // +---+     +---+     +---+
        // | 0 +---->| 1 +---->| 2 |
        // +---+     +---+     +---+
        //
        
        let adjList = [[1], [2], []]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertTrue(result)
    }
    
    func test_isDAG_cycle_singleGraph() {
        //Graph:
        //
        //            +--------+
        //            |        v
        // +---+    +-+-+    +---+
        // | 0 +--->| 1 |<---+ 2 |
        // +---+    +---+    +---+
        //
        
        let adjList = [[1], [2], [1]]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertFalse(result)
    }
    
    func test_isDAG_cycle_selfReferral_singleGraph() {
        //Graph:
        //
        //            +-----+
        //            |     |
        // +---+    +-+-+   |   +---+
        // | 0 +--->| 1 |<--+   | 2 |
        // +---+    +---+       +---+
        //
        
        let adjList = [[1], [1], []]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertFalse(result)
    }
    
    func test_isDAG_noCycle_multipleGraph() {
        //Graph:
        //
        // +---+    +---+    +---+
        // | 0 +--->| 1 +--->| 2 |
        // +---+    +---+    +---+
        //
        // +---+    +---+
        // | 3 +--->| 4 |
        // +---+    +---+
        //
        
        let adjList = [[1], [2], [], [4], []]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertTrue(result)
    }
    func test_isDAG_noCycle_complex_multipleGraph_A() {
        //Graph:
        //
        // +---+    +---+          +---+
        // | 0 +--->| 1 |          | 8 |
        // +---+    +---+          +---+
        //            ^
        //            |
        //          +-+-+    +---+    +---+    +---+
        //          | 2 +--->| 3 +--->| 4 +--->| 5 |
        //          +---+    +---+    +---+    +---+
        //                     ^                 ^
        //                     |                 |
        //                   +-+-+             +-+-+
        //                   | 6 +------------>| 7 |
        //                   +---+             +---+
        
        let adjList = [[1], [], [1, 3], [4], [5], [], [3, 7], [5], []]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertTrue(result)
    }
    
    func test_isDAG_noCycle_complex_multipleGraph_B() {
        //Graph:
        //            +---------------------+
        //            |                     |
        // +---+    +-+-+    +---+          |
        // | 0 |    | 1 |    | 2 +-----+    |
        // +---+    +---+    +---+     |    |
        //   |        |        |       |    |
        //   +--+   +-+        |       |    |
        //      |   |          |       |    |
        //      v   v          |       v    |
        //      +---+          |     +---+  |
        //   +--+ 3 +------+   |     | 4 |<-+
        //   |  +-+-+      |   |     +-+-+
        //   |    |        |   |       |
        //   |    |        |   |       |
        //   v    |        |   v       |
        // +---+  | +---+  | +---+     |
        // | 5 |  +>| 6 |  +>| 7 |     |
        // +---+    +---+    +---+     |
        //            ^                |
        //            |                |
        //            +----------------+
        //
        
        let adjList = [[3], [3, 4], [4, 7], [5, 6, 7], [6], [], [], []]
        
        let result = TopologicalSort.isDAG(adjList)
        
        XCTAssertTrue(result)
    }
}
