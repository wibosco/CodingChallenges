//
//  DFSTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 27/05/2022.
//

import XCTest

@testable import Algorithms

final class DFSTests: XCTestCase {

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
        
        let path = DFS.pathBinarySearchTree(tree, 9)
        
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
        
        let path = DFS.pathBinarySearchTree(tree, 0)
        
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
        
        let path = DFS.pathBinarySearchTree(tree, 5)
        
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
        
        let data = [4, 1, 6, nil, 2]
        
        let tree = BinaryTreeNode.deserialize(data)
        
        let path = DFS.pathBinarySearchTree(tree, 2)
        
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
        
        let path = DFS.pathBinarySearchTree(tree, 8)
        
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
        
        let path = DFS.pathBinarySearchTree(tree, 27)
        
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
        
        let path = DFS.pathBinaryTree(tree, 7)
        
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
        
        let path = DFS.pathBinaryTree(tree, 2)
        
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
        
        let path = DFS.pathBinaryTree(tree, 0)
        
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
        
        let path = DFS.pathBinaryTree(tree, 27)
        
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
        
        let path = DFS.pathGraph(adjList, 0, 5)
        
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
        
        let path = DFS.pathGraph(adjList, 1, 5)
        
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
        
        let path = DFS.pathGraph(adjList, 0, 4)
        
        XCTAssertEqual(path, [0, 1, 4])
    }
    
    func test_graph_path_multiplePathExists_firstPathSearchedReturned() {
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
        //          +---+      +---+
        //   +----->| 1 +----->| 4 +----+
        //   |      +---+      +---+    |
        //   |                          |
        //   |                          |
        // +-+-+               +---+    |
        // | 0 |               | 5 |    |
        // +---+               +---+    |
        //                       ^      |
        //                       |      |
        //                     +-+-+    |
        //                     | 6 |<---+
        //                     +---+
        //
        
        let adjList = [[1, 2], [4], [3, 5], [6], [6], [], [5]]
        
        let path = DFS.pathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 1, 4, 6, 5])
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
        // | 0 |<---+ 2 |      | 5 |
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
        //   |        +----------+
        //   |        |
        //   |        v
        // +-+-+    +---+      +---+
        // | 0 |    | 2 |      | 5 |
        // +---+    +-+-+      +---+
        //            |          ^
        //            v          |
        //          +---+      +-+-+
        //          | 3 +----->| 6 |
        //          +---+      +---+
        //
        
        let adjList = [[1, 2], [4], [0, 3], [0, 6], [2], [], [5]]
        
        let path = DFS.pathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 1, 4, 2, 3, 6, 5])
    }
    
    func test_graph_path_threePathExists_sameNodeVisitedTwice_firstPathReturned() {
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
        // +---+    +---+      +---+
        // | 0 +--->| 2 |      | 5 |
        // +---+    +-+-+      +---+
        //            |          ^
        //            v          |
        //          +---+      +-+-+
        //          | 3 +----->| 6 |
        //          +---+      +---+
        //
        
        let adjList = [[1, 2, 3], [4], [3], [6], [7], [], [5], [7]]
        
        let path = DFS.pathGraph(adjList, 0, 5)
        
        XCTAssertEqual(path, [0, 2, 3, 6, 5])
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
        
        let path = DFS.pathGraph(adjList, 0, 27)
        
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
        
        let path = DFS.pathGraph(adjList, 0, 4)
        
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
        
        let path = DFS.pathGraph(adjList, 3, 2)
        
        XCTAssertNil(path)
    }
}
