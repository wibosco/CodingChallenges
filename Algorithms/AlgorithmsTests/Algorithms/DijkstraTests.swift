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
    
    // MARK: Distance
    
    func test_distance_straightPath_A() {
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
    
    func test_distance_noPath_B() {
        //Graph:
        //0 --> 1 <-- 2
        //
        //Shortest path:
        //None
        
        let adjList: [[(Int, Int)]] = [[(1, 4)], [], [(1, 8)]] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 2)
        
        XCTAssertNil(distance)
    }
    
    func test_distance_directPath_C() {
        //Graph:
        //0 --> 1 --> 2
        //0 --> 3 --> 2
        //
        //Shortest path:
        //0 --> 1
   
        let adjList: [[(Int, Int)]] = [[(1, 4), (3, 6)], [(2, 6)], [], [(2, 2)]] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 1)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 4)
    }
    
    func test_distance_twoPaths_D() {
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
    
    func test_distance_twoPaths_loop_E() {
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
    
    func test_distance_sourceHasNoConnections_F() {
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
    
    func test_distance_onePath_loop_G() {
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
    
    func test_distance_nonZeroSource_directPath_H() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 3
        //
        //Shortest path:
        //1 --> 3

        let adjList: [[(Int, Int)]] = [[(1, 2), (2, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 1, 3)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 2)
    }
    
    func test_distance_nonZeroSource_directPath_nonAscending_I() {
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
    
    func test_distance_twoPaths_initialEdgeIsCheaperButPathLonger_J() {
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
    
    func test_distance_twoPaths_sharedNodes_K() {
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
    
    func test_distance_sourceIsDestination_L() {
        //Graph:
        //0 --> 1 --> 3 --> 4
        //0 --> 2 --> 3 --> 4
        //
        //Shortest path:
        //0
        
        let adjList: [[(Int, Int)]] = [[(1, 3), (2, 4)], [(3, 3)], [(3, 1)], [(4, 2)], []] //(node, distance)
        let distance = Dijkstra.shortestDistance(adjList, 0, 0)
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, 0)
    }
    
    // MARK: Path
    
    func test_path_straightPath_A() {
        //Graph:
        //0 --> 1 --> 2
        //
        //Shortest path:
        //0 --> 1 --> 2
        
        let adjList: [[(Int, Int)]] = [[(1, 4)], [(2, 8)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 2)
        
        XCTAssertEqual(path, [0, 1, 2])
    }
    
    func test_path_noPath_B() {
        //Graph:
        //0 --> 1 <-- 2
        //
        //Shortest path:
        //None
        
        let adjList: [[(Int, Int)]] = [[(1, 4)], [], [(1, 8)]] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 2)
        
        XCTAssertTrue(path.isEmpty)
    }
    
    func test_path_directPath_C() {
        //Graph:
        //0 --> 1 --> 2
        //0 --> 3 --> 2
        //
        //Shortest path:
        //0 --> 3 --> 2
   
        let adjList: [[(Int, Int)]] = [[(1, 4), (3, 6)], [(2, 6)], [], [(2, 2)]] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 2)
        
        XCTAssertEqual(path, [0, 3, 2])
    }
    
    func test_path_twoPaths_D() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2 --> 1 --> 3
        //
        //Shortest path:
        //0 --> 2 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(3, 3)], [(1, 2)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 3)
        
        XCTAssertEqual(path, [0, 2, 1, 3])
    }
    
    func test_path_twoPaths_loop_E() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2 --> 1 --> 3
        //0 --> 1 --> 0
        //
        //Shortest path:
        //0 --> 2 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [(1, 2)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 3)
        
        XCTAssertEqual(path, [0, 2, 1, 3])
    }
    
    func test_path_sourceHasNoConnections_F() {
        //Graph:
        //1 --> 3
        //2 --> 1
        //
        //Shortest path:
        //None
        
        let adjList: [[(Int, Int)]] = [[], [(3, 3)], [(1, 2)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 3)
        
        XCTAssertTrue(path.isEmpty)
    }
    
    func test_path_onePath_loop_G() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 1 --> 0
        //
        //Shortest path:
        //0 --> 1 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 3)
    
        XCTAssertEqual(path, [0, 1, 3])
    }
    
    func test_path_nonZeroSource_directPath_H() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 3
        //
        //Shortest path:
        //1 --> 3

        let adjList: [[(Int, Int)]] = [[(1, 2), (2, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 1, 3)
        
        XCTAssertEqual(path, [1, 3])
    }
    
    func test_path_nonZeroSource_directPath_nonAscending_I() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 2
        //0 --> 1 --> 0
        //
        //Shortest path:
        //1 --> 0
        
        let adjList: [[(Int, Int)]] = [[(1, 5), (2, 2)], [(0, 1), (3, 3)], [], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 1, 0)
        
        XCTAssertEqual(path, [1, 0])
    }
    
    func test_path_twoPaths_initialEdgeIsCheaperButPathLonger_J() {
        //Graph:
        //0 --> 1 --> 3
        //0 --> 3
        //
        //Shortest path:
        //0 --> 3
        
        let adjList: [[(Int, Int)]] = [[(1, 2), (3, 3)], [(3, 2)], [], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 3)
        
        XCTAssertEqual(path, [0, 3])
    }
    
    func test_path_twoPaths_sharedNodes_K() {
        //Graph:
        //0 --> 1 --> 3 --> 4
        //0 --> 2 --> 3 --> 4
        //
        //Shortest path:
        //0 --> 2 --> 3 --> 4
        
        let adjList: [[(Int, Int)]] = [[(1, 3), (2, 4)], [(3, 3)], [(3, 1)], [(4, 2)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 4)
        
        XCTAssertEqual(path, [0, 2, 3, 4])
    }
    
    func test_path_sourceIsDestination_L() {
        //Graph:
        //0 --> 1 --> 3 --> 4
        //0 --> 2 --> 3 --> 4
        //
        //Shortest path:
        //0
        
        let adjList: [[(Int, Int)]] = [[(1, 3), (2, 4)], [(3, 3)], [(3, 1)], [(4, 2)], []] //(node, distance)
        let path = Dijkstra.shortestPath(adjList, 0, 0)
        
        XCTAssertEqual(path, [0])
    }
}
