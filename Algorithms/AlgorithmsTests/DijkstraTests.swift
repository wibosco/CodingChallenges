//
//  DijkstraTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 22/05/2022.
//

import XCTest

@testable import Algorithms

class DijkstraTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        //Graph:
        //0 --> 1 --> 2
        //
        //Shortest path:
        //0 --> 1 --> 2
        
        let adjList: [[(Int, Int)]] = [[(1, 4)], [(2, 8)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 2)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 12)
    }
    
    func test_B() {
        //Graph:
        //0 --> 1 <-- 2
        //
        //Shortest path:
        //None
        
        let adjList: [[(Int, Int)]] = [[(1, 4)], [], [(1, 8)]] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 2)
        
        XCTAssertNil(distance)
    }
    
    func test_C() {
        //Graph:
        //0 --> 1 --> 2
        //0 --> 3 --> 2
        //
        //Shortest path:
        //0 --> 3 --> 2
   
        let adjList: [[(Int, Int)]] = [[(1, 4), (3, 6)], [(2, 6)], [], [(2, 2)]] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 2)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 8)
    }
    
    func test_D() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2 --> 1 --> 3
        //
        //Shortest path:
        //0 --> 2 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(3, 3)], [(1, 2)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 7)
    }
    
    func test_E() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2 --> 1 --> 3
        //0 --> 1 --> 0
        //
        //Shortest path:
        //0 --> 2 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [(1, 2)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 7)
    }
    
    func test_F() {
        //Graph:
        //1 --> 3
        //2 --> 1
        //
        //Shortest path:
        //None
        
        let adjList: [[(Int, Int)]] = [[], [(3, 3)], [(1, 2)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNil(distance)
    }
    
    func test_G() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 1 --> 0
        //
        //Shortest path:
        //0 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 8)
    }
    
    func test_H() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 3
        //
        //Shortest path:
        //0 --> 3

        let adjList: [[(Int, Int)]] = [[(1, 2), (2, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 3)
    }
    
    func test_I() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 3
        //
        //Shortest path:
        //0 --> 3

        let adjList: [[(Int, Int)]] = [[(1, 2), (2, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 1, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 2)
    }
    
    func test_J() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 1 --> 0
        //
        //Shortest path:
        //1 --> 0
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 1, 0)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 1)
    }
    
    func test_K() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 3
        //
        //Shortest path:
        //0 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 3)
    }
    
    func test_L() {
        //Graph:
        //0 --> 1 --> 3 --> 4
        //0 --> 2 --> 3 --> 4
        //
        //Shortest path:
        //0 --> 2 --> 3 --> 4
        
        let adjList: [[(Int, Int)]] = [[(1, 3), (2, 4)], [(3, 3)], [(3, 1)], [(4, 2)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 4)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 7)
    }
}
