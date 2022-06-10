//
//  KruskalTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 10/06/2022.
//

import XCTest

@testable import Algorithms

class KruskalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        //Graph:
        //
        //           +---+
        //   +---6---+ 0 +---5---+
        //   |       +-+-+       |
        //   |         |         |
        // +-+-+       |       +-+-+
        // | 1 +-5-+   1   +-5-+ 3 |
        // +-+-+   |   |   |   +-+-+
        //   |     |   |   |     |
        //   |     | +-+-+ |     |
        //   3     +-+ 2 +-+     2
        //   |       ++-++       |
        //   |        | |        |
        //   |        | |        |
        // +-+-+      | |      +-+-+
        // | 4 +---6--+ +--4---+ 5 |
        // +-+-+               +-+-+
        //   |                   |
        //   |                   |
        //   +---------6---------+
        //
        //MST:
        //
        //           +---+
        //           | 0 |
        //           +-+-+
        //             |
        // +---+       |       +---+
        // | 1 +-5-+   1       | 3 |
        // +-+-+   |   |       +-+-+
        //   |     |   |         |
        //   |     | +-+-+       |
        //   3     +-+ 2 |       2
        //   |       +-+-+       |
        //   |         |         |
        //   |         |         |
        // +-+-+       |       +-+-+
        // | 4 |       +---4---+ 5 |
        // +---+               +---+
        //
        
        let adjList: [[(vertice: Int, weight: Int)]] = [[(1, 6), (2, 1), (3, 5)],
                                                        [(0, 6), (2, 5), (4, 3)],
                                                        [(0, 1), (1, 5), (3, 5), (4, 6), (5, 4)],
                                                        [(0, 5), (2, 5), (5, 2)],
                                                        [(1, 3), (2, 6), (5, 6)],
                                                        [(2, 4), (3, 2), (4, 6)]]
        
        let mst = Kruskal.minimumSpanningTree(adjList)
        
        guard let mst = mst else {
            XCTFail("MST is nil")
            return
        }

        XCTAssertEqual(mst.count, 5)
        
        XCTAssertEqual(mst[0].source, 0)
        XCTAssertEqual(mst[0].destination, 2)
        XCTAssertEqual(mst[0].weight, 1)
        
        XCTAssertEqual(mst[1].source, 3)
        XCTAssertEqual(mst[1].destination, 5)
        XCTAssertEqual(mst[1].weight, 2)
        
        XCTAssertEqual(mst[2].source, 1)
        XCTAssertEqual(mst[2].destination, 4)
        XCTAssertEqual(mst[2].weight, 3)
        
        XCTAssertEqual(mst[3].source, 2)
        XCTAssertEqual(mst[3].destination, 5)
        XCTAssertEqual(mst[3].weight, 4)
        
        XCTAssertEqual(mst[4].source, 1)
        XCTAssertEqual(mst[4].destination, 2)
        XCTAssertEqual(mst[4].weight, 5)
    }
    
    func test_B() {
        //Graph:
        //
        //           +---+
        //   +---6---+ 0 +---5---+
        //   |       +-+-+       |
        //   |         |         |
        // +-+-+       |       +-+-+
        // | 1 +-5-+   1   +-5-+ 3 |
        // +-+-+   |   |   |   +-+-+
        //   |     |   |   |     |
        //   |     | +-+-+ |     |
        //   3     +-+ 2 +-+     8
        //   |       ++-++       |
        //   |        | |        |
        //   |        | |        |
        // +-+-+      | |      +-+-+
        // | 4 +---6--+ +--4---+ 5 |
        // +-+-+               +-+-+
        //   |                   |
        //   |                   |
        //   +---------6---------+
        //
        //MST:
        //
        //           +---+
        //           | 0 +---5---+
        //           +-+-+       |
        //             |         |
        // +---+       |       +-+-+
        // | 1 +-5-+   1       | 3 |
        // +-+-+   |   |       +---+
        //   |     |   |
        //   |     | +-+-+
        //   3     +-+ 2 +
        //   |       +-+-+
        //   |         |
        //   |         |
        // +-+-+       |       +-+-+
        // | 4 |       +---4---+ 5 |
        // +---+               +---+
        //
        
        //Compared to `test_A`, the edge between 3, 5 now has a weight of 8
        let adjList: [[(vertice: Int, weight: Int)]] = [[(1, 6), (2, 1), (3, 5)],
                                                        [(0, 6), (2, 5), (4, 3)],
                                                        [(0, 1), (1, 5), (3, 5), (4, 6), (5, 4)],
                                                        [(0, 5), (2, 5), (5, 8)],
                                                        [(1, 3), (2, 6), (5, 6)],
                                                        [(2, 4), (3, 8), (4, 6)]]
        
        let mst = Kruskal.minimumSpanningTree(adjList)
        
        guard let mst = mst else {
            XCTFail("MST is nil")
            return
        }

        XCTAssertEqual(mst.count, 5)
        
        XCTAssertEqual(mst[0].source, 0)
        XCTAssertEqual(mst[0].destination, 2)
        XCTAssertEqual(mst[0].weight, 1)
        
        XCTAssertEqual(mst[1].source, 1)
        XCTAssertEqual(mst[1].destination, 4)
        XCTAssertEqual(mst[1].weight, 3)
        
        XCTAssertEqual(mst[2].source, 2)
        XCTAssertEqual(mst[2].destination, 5)
        XCTAssertEqual(mst[2].weight, 4)
        
        XCTAssertEqual(mst[3].source, 0)
        XCTAssertEqual(mst[3].destination, 3)
        XCTAssertEqual(mst[3].weight, 5)
        
        XCTAssertEqual(mst[4].source, 1)
        XCTAssertEqual(mst[4].destination, 2)
        XCTAssertEqual(mst[4].weight, 5)
    }
    
    func test_C() {
        //Graph:
        //
        //         +---+              +---+              +---+
        //  +--4---+ 1 +------8-------+ 2 +------7-------+ 3 +-------+
        //  |      +-+-+              ++-++              +--++       |
        //  |        |                 | |                  |        |
        //  |        |                 2 +-------4--------+ |        9
        //  |       ++                 ++                 | |        |
        //  |       |                   |                 | |        |
        // +-+-+    |                 +-+-+               | |      +-+-+
        // | 0 |   11 +-------7-------+ 8 |               | 14     | 4 |
        // +-+-+    | |               +-+-+               | |      +-+-+
        //  |       | |                 |                 | |        |
        //  |       | |                 |                 | |        10
        //  |       | |                 |                 | |        |
        //  |      ++-++              +-+-+              ++-++       |
        //  +--8---+ 7 +------1-------+ 6 +------2-------+ 5 +-------+
        //         +---+              +---+              +---+
        //
        //MST:
        //
        //         +---+              +---+              +---+
        //  +--4---+ 1 |              | 2 +------7-------+ 3 +-------+
        //  |      +---+              ++-++              +---+       |
        //  |                          | |                           |
        //  |                          2 +-------4--------+          9
        //  |                          ++                 |          |
        //  |                           |                 |          |
        // +-+-+                      +-+-+               |        +-+-+
        // | 0 |                      | 8 |               |        | 4 |
        // +-+-+                      +---+               |        +---+
        //  |                                             |
        //  |                                             |
        //  |                                             |
        //  |      +---+              +---+              ++-++
        //  +--8---+ 7 +------1-------+ 6 +------2-------+ 5 |
        //         +---+              +---+              +---+
        //
        
        let adjList: [[(vertice: Int, weight: Int)]] = [[(1, 4), (7, 8)],
                                                        [(0, 4), (2, 8), (7, 11)],
                                                        [(1, 8), (3, 7), (5, 4), (8, 2)],
                                                        [(2, 7), (4, 9), (5, 14)],
                                                        [(3, 9), (5, 10)],
                                                        [(2, 4), (3, 14), (4, 10), (6, 2)],
                                                        [(5, 2), (7, 1), (8, 6)],
                                                        [(0, 8), (1, 11), (6, 1), (8, 7)],
                                                        [(2, 2), (6, 6), (7, 7)]]
        
        let mst = Kruskal.minimumSpanningTree(adjList)
        
        guard let mst = mst else {
            XCTFail("MST is nil")
            return
        }

        XCTAssertEqual(mst.count, 8)
        
        XCTAssertEqual(mst[0].source, 6)
        XCTAssertEqual(mst[0].destination, 7)
        XCTAssertEqual(mst[0].weight, 1)
        
        XCTAssertEqual(mst[1].source, 2)
        XCTAssertEqual(mst[1].destination, 8)
        XCTAssertEqual(mst[1].weight, 2)
        
        XCTAssertEqual(mst[2].source, 5)
        XCTAssertEqual(mst[2].destination, 6)
        XCTAssertEqual(mst[2].weight, 2)
        
        XCTAssertEqual(mst[3].source, 0)
        XCTAssertEqual(mst[3].destination, 1)
        XCTAssertEqual(mst[3].weight, 4)
        
        XCTAssertEqual(mst[4].source, 2)
        XCTAssertEqual(mst[4].destination, 5)
        XCTAssertEqual(mst[4].weight, 4)
        
        XCTAssertEqual(mst[5].source, 2)
        XCTAssertEqual(mst[5].destination, 3)
        XCTAssertEqual(mst[5].weight, 7)
        
        XCTAssertEqual(mst[6].source, 0)
        XCTAssertEqual(mst[6].destination, 7)
        XCTAssertEqual(mst[6].weight, 8)
        
        XCTAssertEqual(mst[7].source, 3)
        XCTAssertEqual(mst[7].destination, 4)
        XCTAssertEqual(mst[7].weight, 9)
    }
}
