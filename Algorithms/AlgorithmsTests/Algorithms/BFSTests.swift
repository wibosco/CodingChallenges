//
//  BFSTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 26/05/2022.
//

import XCTest

@testable import Algorithms

final class BFSTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: - Path
    
    // MARK: BinarySearchTree
    
    func test_binarySearchTree_path_pathExists_rightLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 9)
        
        XCTAssertEqual(path, [4, 6, 8, 9])
    }
    
    func test_binarySearchTree_path_pathExists_leftLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 0)
        
        XCTAssertEqual(path, [4, 1, 0])
    }
    
    func test_binarySearchTree_path_leftBranchDoesNotExist_pathExists() {
        //Tree:
        //
        // +---+
        // | 4 +---------+
        // +---+         |
        //               |
        //               v
        //             +---+
        //        +----+ 6 +----+
        //        |    +---+    |
        //        |             |
        //        v             v
        //      +---+         +---+
        //      | 5 |    +----+ 8 +----+
        //      +---+    |    +---+    |
        //               |             |
        //               v             v
        //             +---+         +---+
        //             | 7 |         | 9 |
        //             +---+         +---+
        //
        
        let data = [4, nil, 6, 5, 8, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 5)
        
        XCTAssertEqual(path, [4, 6, 5])
    }
    
    func test_binarySearchTree_path_rightBranchDoesNotExist_pathExists() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 |
        //   |         +---+
        //   |
        //   v
        // +---+
        // | 1 +----+
        // +---+    |
        //          |
        //          v
        //        +---+
        //        | 2 |
        //        +---+
        //
        
        let data = [4, 1, nil, nil, 2]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 2)
        
        XCTAssertEqual(path, [4, 1, 2])
    }
    
    func test_binarySearchTree_path_pathExists_midNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 8)
        
        XCTAssertEqual(path, [4, 6, 8])
    }
    
    func test_binarySearchTree_path_noPathExists() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinarySearchTree(tree, 27)
        
        XCTAssertNil(path)
    }
    
    // MARK: BinaryTree
    
    func test_binaryTree_path_pathExists_rightLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinaryTree(tree, 7)
        
        XCTAssertEqual(path, [9, 1, 0, 7])
    }
    
    func test_binaryTree_path_pathExists_leftLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinaryTree(tree, 2)
        
        XCTAssertEqual(path, [9, 6, 2])
    }
    
    func test_binaryTree_path_pathExists_midNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+              | 1 +----+
        //   |    +---+    |              +---+    |
        //   |             |                       |
        //   v             v                       v
        // +---+         +---+                   +---+
        // | 8 |         | 2 |              +----+ 0 +----+
        // +---+         +---+              |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, nil, 0, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinaryTree(tree, 0)
        
        XCTAssertEqual(path, [9, 1, 0])
    }
    
    func test_binaryTree_path_noPathExists() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = BFS.shortestPathBinaryTree(tree, 27)
        
        XCTAssertNil(path)
    }
    
    // MARK: Graph
    
    func test_graph_path_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+               +---+
        // | 0 |               | 5 |
        // +-+-+               +---+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let path = BFS.shortestPathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 1, 4, 5])
    }
    
    func test_graph_path_nonZeroStart_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        // +---+      +---+
        // | 1 +----->| 4 |
        // +---+      +-+-+
        //              |
        //              v
        //            +---+
        //            | 5 |
        //            +---+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let path = BFS.shortestPathGraph(adjList, 1, 5)
        
        XCTAssertEqual(path, [1, 4, 5])
    }
    
    func test_graph_path_nonLeafTarget_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +---+
        //   |
        //   |
        // +-+-+
        // | 0 |
        // +-+-+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let path = BFS.shortestPathGraph(adjList, 0, 4)
        
        XCTAssertEqual(path, [0, 1, 4])
    }
    
    func test_graph_path_twoPathExists_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //            |          ^
        //            v          |
        //          +---+      +-+-+
        //          | 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +---+
        //   |
        //   |
        // +-+-+
        // | 0 |
        // +-+-+
        //
        
        let adjList = [[1, 2], [4], [3], [6], [5], [], [5]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 4)
        
        XCTAssertEqual(path, [0, 1, 4])
    }
    
    func test_graph_path_multiplePathExists_longerPathCheckedFirst_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 +----+
        //   |      +---+      +---+    |
        //   |                          |
        //   |                          |
        // +-+-+    +---+      +---+    |
        // | 0 +--->| 2 +----->| 5 |    |
        // +---+    +-+-+      +---+    |
        //            |          ^      |
        //            v          |      |
        //          +---+      +-+-+    |
        //          | 3 +----->| 6 |<---+
        //          +---+      +---+
        //
        //Shortest Path:
        //
        //
        // +---+    +---+      +---+
        // | 0 +--->| 2 +----->| 5 |
        // +---+    +---+      +---+
        //
        
        let adjList = [[1, 2], [4], [3, 5], [6], [6], [], [5]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 2, 5])
    }
    
    func test_graph_path_twoPathExists_loopExists_loopIsSkipped_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |        +----------+
        //   |        |
        //   |        v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //   ^        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +------+ 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //            |          ^
        //            v          |
        //          +---+      +-+-+
        //          | 3 +----->| 6 |
        //          +---+      +---+
        //
        
        let adjList = [[1, 2], [4], [3], [0, 6], [2], [], [5]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 2, 3, 6, 5])
    }
    
    func test_graph_path_threePathExists_sameNodeVisitedTwice_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+      +---+
        //   +----->| 1 +----->| 4 +----->| 7 |
        //   |      +---+      +-+-+      +-+-+
        //   |                              |
        //   |                              |
        // +-+-+    +---+      +---+        |
        // | 0 +--->| 2 |      | 5 |<-------+
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        // +---+               +---+
        // | 0 |               | 5 |
        // +-+-+               +---+
        //   |                   ^
        //   |                   |
        //   |      +---+      +-+-+
        //   +----->| 3 +----->| 6 |
        //          +---+      +---+
        //
        
        let adjList = [[1, 2, 3], [4], [3], [6], [7], [], [5], [7]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 3, 6, 5])
    }
    
    func test_graph_path_nodeDoesNotExist_noPathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [4], [3], [6], [5], [], [5]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 27)
        
        XCTAssertNil(path)
    }
    
    func test_graph_path_isolatedSubGraphs_noPathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 |      | 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 |      | 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [], [3], [], [5], [], [5]]
        
        let path = BFS.shortestPathGraph(adjList, 0, 4)
        
        XCTAssertNil(path)
    }
    
    func test_graph_path_directGraph_directionMatters_noPathExists() {
        //Graph:
        //
        //          +---+
        //   +----->| 1 |
        //   |      +---+
        //   |
        //   |
        // +-+-+    +---+
        // | 0 +--->| 2 |
        // +-+-+    +-+-+
        //   |        |
        //   |        v
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [], [3], []]
        
        let path = BFS.shortestPathGraph(adjList, 3, 2)
        
        XCTAssertNil(path)
    }
    
    // MARK: - Distance
    
    // MARK: BinarySearchTree
    
    func test_binarySearchTree_distance_pathExists_rightLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 9)
        
        XCTAssertEqual(distance, 4)
    }
    
    func test_binarySearchTree_distance_pathExists_leftLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 0)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binarySearchTree_distance_leftBranchDoesNotExist_pathExists() {
        //Tree:
        //
        // +---+
        // | 4 +---------+
        // +---+         |
        //               |
        //               v
        //             +---+
        //        +----+ 6 +----+
        //        |    +---+    |
        //        |             |
        //        v             v
        //      +---+         +---+
        //      | 5 |    +----+ 8 +----+
        //      +---+    |    +---+    |
        //               |             |
        //               v             v
        //             +---+         +---+
        //             | 7 |         | 9 |
        //             +---+         +---+
        //
        
        let data = [4, nil, 6, 5, 8, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 5)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binarySearchTree_distance_rightBranchDoesNotExist_pathExists() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 |
        //   |         +---+
        //   |
        //   v
        // +---+
        // | 1 +----+
        // +---+    |
        //          |
        //          v
        //        +---+
        //        | 2 |
        //        +---+
        //
        
        let data = [4, 1, 6, nil, 2]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 2)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binarySearchTree_distance_pathExists_midNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 8)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binarySearchTree_distance_noPathExists() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 6 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |    +----+ 8 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinarySearchTree(tree, 27)
        
        XCTAssertNil(distance)
    }
    
    // MARK: BinaryTree
    
    func test_binaryTree_distance_pathExists_rightLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinaryTree(tree, 7)
        
        XCTAssertEqual(distance, 4)
    }
    
    func test_binaryTree_distance_pathExists_leftLeafNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinaryTree(tree, 2)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binaryTree_distance_pathExists_midNode() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+              | 1 +----+
        //   |    +---+    |              +---+    |
        //   |             |                       |
        //   v             v                       v
        // +---+         +---+                   +---+
        // | 8 |         | 2 |              +----+ 0 +----+
        // +---+         +---+              |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, nil, 0, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinaryTree(tree, 0)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_binaryTree_distance_noPathExists() {
        //Tree:
        //
        //                    +---+
        //          +---------+ 9 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 6 +----+         +----+ 1 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 8 |         | 2 |     | 5 |    +----+ 0 +----+
        // +---+         +---+     +---+    |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 4 |
        //                                +---+         +---+
        //
        //
        
        let data = [9, 6, 1, 8, 2, 5, 0, nil, nil, nil, nil, nil, nil, 7, 4]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let distance = BFS.shortestDistanceBinaryTree(tree, 27)
        
        XCTAssertNil(distance)
    }
    
    // MARK: Graph
    
    func test_graph_distance_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+               +---+
        // | 0 |               | 5 |
        // +-+-+               +---+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 5)
        
        XCTAssertEqual(distance, 4)
    }
    
    func test_graph_distance_nonZeroStart_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        // +---+      +---+
        // | 1 +----->| 4 |
        // +---+      +-+-+
        //              |
        //              v
        //            +---+
        //            | 5 |
        //            +---+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let distance = BFS.shortestDistanceGraph(adjList, 1, 5)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_graph_distance_nonLeafTarget_singlePathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +---+      +---+
        //   |
        //   |
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //
        // +---+      +---+
        // | 1 +----->| 4 |
        // +---+      +-+-+
        //              |
        //              v
        //            +---+
        //            | 5 |
        //            +---+
        //
        
        let adjList = [[1, 2, 3], [4], [], [], [5], []]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 4)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_graph_distance_twoPathExists_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //            |          ^
        //            v          |
        //          +---+      +-+-+
        //          | 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +---+
        //   |
        //   |
        // +-+-+
        // | 0 |
        // +-+-+
        //
        
        let adjList = [[1, 2], [4], [3], [6], [5], [], [5]]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 4)
        
        XCTAssertEqual(distance, 3)
    }
    
    func test_graph_distance_twoPathExists_loopExists_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //   ^        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +------+ 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+               +---+
        // | 0 |               | 5 |
        // +-+-+               +---+
        //
        
        let adjList = [[1, 2], [4], [3], [1, 6], [5], [], [5]]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 5)
        
        XCTAssertEqual(distance, 4)
    }
    
    func test_graph_distance_twoPathExists_sameNodeVisitedTwice_shorterPathReturned() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   V
        // +-+-+               +---+
        // | 0 |               | 5 |
        // +-+-+               +---+
        //
        
        let adjList = [[1, 2, 3], [4], [3], [6], [5], [], [5]]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 5)
        
        XCTAssertEqual(distance, 4)
    }
    
    func test_graph_distance_noPathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 +----->| 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 +----->| 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [4], [3], [6], [5], [], [5]]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 27)
        
        XCTAssertNil(distance)
    }
    
    func test_graph_distance_isolatedSubGraphs_noPathExists() {
        //Graph:
        //
        //          +---+      +---+
        //   +----->| 1 |      | 4 |
        //   |      +---+      +-+-+
        //   |                   |
        //   |                   v
        // +-+-+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +-+-+    +-+-+      +---+
        //   |        |          ^
        //   |        v          |
        //   |      +---+      +-+-+
        //   +----->| 3 |      | 6 |
        //          +---+      +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [], [3], [], [5], [], [5]]
        
        let distance = BFS.shortestDistanceGraph(adjList, 0, 4)
        
        XCTAssertNil(distance)
    }
    
    func test_graph_distance_directGraph_directionMatters_noPathExists() {
        //Graph:
        //
        //          +---+
        //   +----->| 1 |
        //   |      +---+
        //   |
        //   |
        // +-+-+    +---+
        // | 0 +--->| 2 |
        // +-+-+    +-+-+
        //   |        |
        //   |        v
        //   |      +---+
        //   +----->| 3 |
        //          +---+
        //
        //Shortest Path:
        //None
        
        let adjList = [[1, 2, 3], [], [3], []]
        
        let distance = BFS.shortestDistanceGraph(adjList, 3, 2)
        
        XCTAssertNil(distance)
    }
}
