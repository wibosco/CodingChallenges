//
//  BinarySearchTreeTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 16/04/2023.
//

import XCTest

@testable import Algorithms

final class BinarySearchTreeTests: XCTestCase {
    
    // MARK: - Tests
    
    // MARK: Find
    
    func test_givenAMultiLevelTree_whenISearchForAnElement_andThatElementExists_thenItShouldBeReturned() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.find(8)
        
        XCTAssertEqual(result?.val, 8)
    }
    
    func test_givenAMultiLevelTree_whenISearchForAnElement_andThatElementDoesNotExist_thenNilShouldBeReturned() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.find(3)
        
        XCTAssertNil(result)
    }
    
    // MARK: - FindMin
    
    func test_givenAMultiLevelTree_whenIWantToFindTheMin_andTheMinIsNotTheRoot_thenMinShouldBeReturned() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.findMin()
        
        XCTAssertEqual(result?.val, 0)
    }
    
    func test_givenAMultiLevelTree_whenIWantToFindTheMin_andTheMinIsTheRoot_thenMinShouldBeReturned() {
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
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.findMin()
        
        XCTAssertEqual(result?.val, 4)
    }
    
    // MARK: FindMax
    
    func test_givenAMultiLevelTree_whenIWantToFindTheMax_andTheMaxIsNotTheRoot_thenMaxShouldBeReturned() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.findMax()
        
        XCTAssertEqual(result?.val, 9)
    }
    
    func test_givenAMultiLevelTree_whenIWantToFindTheMax_andTheMaxIsTheRoot_thenMaxShouldBeReturned() {
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
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.findMax()
        
        XCTAssertEqual(result?.val, 4)
    }
    
    // MARK: Traversal
    
    func test_givenAMultiLevelTree_whenIPerformAInorderTraversal_thenElementsShouldBeInCorrectOrder() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.inorderTraversal()
        
        let values = result.map { $0.val }
        
        XCTAssertEqual(values, [0, 1, 2, 4, 5, 6, 7, 8, 9])
    }
    
    func test_givenAMultiLevelTree_whenIPerformAPreorderTraversal_thenElementsShouldBeInCorrectOrder() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.preorderTraversal()
        
        let values = result.map { $0.val }
        
        XCTAssertEqual(values, [4, 1, 0, 2, 6, 5, 8, 7, 9])
    }
    
    func test_givenAMultiLevelTree_whenIPerformAPostorderTraversal_thenElementsShouldBeInCorrectOrder() {
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
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.postorderTraversal()
        
        let values = result.map { $0.val }
        
        XCTAssertEqual(values, [0, 2, 1, 5, 7, 9, 8, 6, 4])
    }
    
    // MARK: Height
    
    func test_givenAnEmptyTree_whenIWantTheHeightOfTheTree_thenCorrectHeightIsReturned() {
        let sut = BinarySearchTree<Int>(root: nil)
        
        let result = sut.height()
        
        XCTAssertEqual(result, -1)
    }
    
    func test_givenAnSingleNodeTree_whenIWantTheHeightOfTheTree_thenCorrectHeightIsReturned() {
        //Initial Tree:
        //
        // +---+
        // | 4 |
        // +---+
        //
        
        let root = BinaryTreeNode(4)
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.height()
        
        XCTAssertEqual(result, 0)
    }
    
    func test_givenAMultiLevelTree_whenIWantTheHeightOfTheTree_thenCorrectHeightIsReturned() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.height()
        
        XCTAssertEqual(result, 3)
    }
    
    func test_givenAMultiLevelTree_whenIWantTheHeightOfAMidTreeNode_thenCorrectHeightIsReturned() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.height(root.right!)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_givenAMultiLevelTree_whenIWantTheHeightOfALeafNode_thenCorrectHeightIsReturned() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.height(root.right!.right!.left!)
        
        XCTAssertEqual(result, 0)
    }
    
    // MARK: Depth
    
    func test_givenAnSingleNodeTree_whenIWantTheDepthOfTheRoot_thenCorrectHeightIsReturned() {
        //Initial Tree:
        //
        // +---+
        // | 4 |
        // +---+
        //
        
        let root = BinaryTreeNode(4)
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.depth(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_givenAMultiLevelTree_whenIWantTheDepthOfAMidTreeNode_thenCorrectDepthIsReturned() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.depth(root.right!.right!)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_givenAMultiLevelTree_whenIWantTheDepthOfALeafNode_thenCorrectDepthIsReturned() {
        //Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree<Int>(root: root)
        
        let result = sut.depth(root.right!.right!.left!)
        
        XCTAssertEqual(result, 3)
    }
    
    // MARK: Insert
    
    func test_givenAMultilevelTree_whenIInsertANewHighestValueNode_thenItShouldBePlacedFarRight() {
        //Initial Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        //After insertion:
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // + 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 +----+
        //        +---+     +---+    |    +---+    |
        //                           |             |
        //                           v             v
        //                         +---+         +---+
        //                         | 7 |         | 9 |
        //                         +---+         +---+
        
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.insert(9)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, 9])
    }
    
    func test_givenAMultilevelTree_whenIInsertANewLowestValueNode_thenItShouldBePlacedFarLeft() {
        //Initial Tree:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |    +----+ 8 |
        //        +---+     +---+    |    +---+
        //                           |
        //                           v
        //                         +---+
        //                         | 7 |
        //                         +---+
        //
        //After insertion:
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
        // | 0 |         | 2 |     | 5 |    +----+ 8 |
        // +---+         +---+     +---+    |    +---+
        //                                  |
        //                                  v
        //                                +---+
        //                                | 7 |
        //                                +---+
        
        let data = [4, 1, 6, nil, 2, 5, 8, nil, nil, nil, nil, 7, nil]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.insert(0)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7])
    }
    
    func test_givenAnEmptyTree_whenIInsertAValue_thenItShouldBeMadeRoot() {
        let sut = BinarySearchTree<Int>(root: nil)
        
        sut.insert(20)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [20])
    }
    
    // MARK: Deletion
    
    func test_givenATreeWhereTheRootDoesNotHaveALeftSubtree_whenIDeleteRoot_theRootsRightTreeIsMadeRoot() {
        //Initial Tree:
        //
        // +---+
        // | 4 +---------+
        // +---+         |
        //               |
        //               v
        //             +---+
        //             | 6 |
        //             +---+
        //
        //After Deletion:
        //
        // +---+
        // | 6 |
        // +---+
        //
        
        let data = [4, nil, 6]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(4)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [6])
    }
    
    func test_givenATreeWhereTheRootDoesNotHaveARightSubtree_whenIDeleteRoot_theRootsLeftTreeIsMadeRoot() {
        //Initial Tree:
        //
        //             +---+
        //   +---------+ 4 |
        //   |         +---+
        //   |
        //   v
        // +---+
        // | 1 |
        // +---+
        //
        //After Deletion:
        //
        // +---+
        // | 1 |
        // +---+
        //
        
        let data = [4, 1]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(4)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [1])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteTheRoot_thenTheSuccessorShouldBecomeRoot() {
        //Initial Tree:
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
        //After Deletion:
        //
        //                    +---+
        //          +---------+ 5 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+              | 6 +----+
        //   |    +---+    |              +---+    |
        //   |             |                       |
        //   v             v                       v
        // +---+         +---+                   +---+
        // | 0 |         | 2 |              +----+ 8 +----+
        // +---+         +---+              |    +---+    |
        //                                  |             |
        //                                  v             v
        //                                +---+         +---+
        //                                | 7 |         | 9 |
        //                                +---+         +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(4)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [5, 1, 6, 0, 2, nil, 8, nil, nil, nil, nil, 7, 9])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteALeftLeafNode_thenThatLeafNodeIsNoLongerPartOfTheTree() {
        //Initial Tree:
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
        // | 0 |         | 2 |     | 5 |         | 8 |
        // +---+         +---+     +---+         +---+
        //
        //After Deletion:
        //
        //             +---+
        //   +---------+ 4 +---------+
        //   |         +---+         |
        //   |                       |
        //   v                       v
        // +---+                   +---+
        // | 1 +----+         +----+ 6 +----+
        // +---+    |         |    +---+    |
        //          |         |             |
        //          v         v             v
        //        +---+     +---+         +---+
        //        | 2 |     | 5 |         | 8 |
        //        +---+     +---+         +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(0)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, nil, 2, 5, 8])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteARightLeafNode_thenThatLeafNodeIsNoLongerPartOfTheTree() {
        //Initial Tree:
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
        // | 0 |         | 2 |     | 5 |         | 8 |
        // +---+         +---+     +---+         +---+
        //
        //After Deletion:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 |              +----+ 6 +----+
        //   |    +---+              |    +---+    |
        //   |                       |             |
        //   v                       v             v
        // +---+                   +---+         +---+
        // | 0 |                   | 5 |         | 8 |
        // +---+                   +---+         +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(2)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, 0, nil, 5, 8])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteARightLeafNodeFromTheRightSubtree_thenThatLeafNodeIsNoLongerPartOfTheTree() {
        //Initial Tree:
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
        //After Deletion:
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
        // | 0 |         | 2 |     | 5 |    +----+ 8 |
        // +---+         +---+     +---+    |    +---+
        //                                  |
        //                                  v
        //                                +---+
        //                                | 7 |
        //                                +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(9)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteAMidTreeNode_andItsImmediateRightNodeIsItsSuccessor_thenSuccessorIsMovedUpToDeletedNodesPosition() {
        //Initial Tree:
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
        //After Deletion:
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
        // | 0 |         | 2 |     | 5 |    +----+ 9 |
        // +---+         +---+     +---+    |    +---+
        //                                  |
        //                                  v
        //                                +---+
        //                                | 7 |
        //                                +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(8)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 6, 0, 2, 5, 9, nil, nil, nil, nil, nil, nil, 7])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteAMidTreeNode_andItsSuccessorIsMultiLevelsDown_thenSuccessorIsMovedUpToDeletedNodesPosition() {
        //Initial Tree:
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
        //
        // After deletion:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 7 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |         | 8 +----+
        // +---+         +---+     +---+         +---+    |
        //                                                |
        //                                                v
        //                                              +---+
        //                                              | 9 |
        //                                              +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, 7, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(6)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 7, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, nil, 9])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteAMidTreeNode_andItsImmediateRightNodeIsItsSuccessor_andThatSuccessorHasARightChild_thenSuccessorIsMovedUpToDeletedNodesPosition_andRightSubtreeIsPreserved() {
        //Initial Tree:
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
        // | 0 |         | 2 |     | 5 |         | 8 +----+
        // +---+         +---+     +---+         +---+    |
        //                                                |
        //                                                v
        //                                              +---+
        //                                              | 9 |
        //                                              +---+
        //
        //
        //
        // After deletion:
        //
        //                    +---+
        //          +---------+ 4 +---------+
        //          |         +---+         |
        //          |                       |
        //          v                       v
        //        +---+                   +---+
        //   +----+ 1 +----+         +----+ 8 +----+
        //   |    +---+    |         |    +---+    |
        //   |             |         |             |
        //   v             v         v             v
        // +---+         +---+     +---+         +---+
        // | 0 |         | 2 |     | 5 |         | 9 |
        // +---+         +---+     +---+         +---+
        //
        
        let data = [4, 1, 6, 0, 2, 5, 8, nil, nil, nil, nil, nil, nil, nil, 9]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(6)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [4, 1, 8, 0, 2, 5, 9])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteAMidTreeNode_andItsSuccessorIsMultiLevelsDown_andThatSuccessorHasARightChild_thenSuccessorIsMovedUpToDeletedNodesPosition_andRightSubtreeIsPreserved() {
        //Initial Tree:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 4 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |       +-------+ 8 +-------+
        // +---+                   +---+       |       +---+       |
        //                                     |                   |
        //                                     v                   v
        //                                   +---+               +---+
        //                                   | 6 +----+          | 9 |
        //                                   +---+    |          +---+
        //                                            |
        //                                            v
        //                                          +---+
        //                                          | 7 |
        //                                          +---+
        //
        //
        // After deletion:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 6 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |       +-------+ 8 +-------+
        // +---+                   +---+       |       +---+       |
        //                                     |                   |
        //                                     v                   v
        //                                   +---+               +---+
        //                                   | 7 |               | 9 |
        //                                   +---+               +---+
        //
        
        let data = [2, 1, 4, 0, nil, 5, 8, nil, nil, nil, nil, 6, 9, nil, 7]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(4)
        
        let serialized = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serialized, [2, 1, 6, 0, nil, 5, 8, nil, nil, nil, nil, 7, 9])
    }
    
    func test_givenATreeWhereTheRootHasBothMultilevelLeftAndRightSubtrees_whenIDeleteMultipleNodes_thenEachCompoundDeletionIsCorrect() {
        //Initial Tree:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 4 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |       +-------+ 8 +-------+
        // +---+                   +---+       |       +---+       |
        //                                     |                   |
        //                                     v                   v
        //                                   +---+               +---+
        //                                   | 6 +----+          | 9 |
        //                                   +---+    |          +---+
        //                                            |
        //                                            v
        //                                          +---+
        //                                          | 7 |
        //                                          +---+
        //
        //
        // After first deletion:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 6 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |       +-------+ 8 +-------+
        // +---+                   +---+       |       +---+       |
        //                                     |                   |
        //                                     v                   v
        //                                   +---+               +---+
        //                                   | 7 |               | 9 |
        //                                   +---+               +---+
        //
        //
        // After second deletion:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 7 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |               | 8 +-------+
        // +---+                   +---+               +---+       |
        //                                                         |
        //                                                         v
        //                                                       +---+
        //                                                       | 9 |
        //                                                       +---+
        //
        //
        // After third deletion:
        //
        //                       +---+
        //             +---------+ 2 +---------+
        //             |         +---+         |
        //             |                       |
        //             v                       v
        //           +---+                   +---+
        //   +-------+ 1 |           +-------+ 8 +-------+
        //   |       +---+           |       +---+       |
        //   |                       |                   |
        //   v                       v                   v
        // +---+                   +---+               +---+
        // | 0 |                   | 5 |               | 9 |
        // +---+                   +---+               +---+
        //
        
        let data = [2, 1, 4, 0, nil, 5, 8, nil, nil, nil, nil, 6, 9, nil, 7]
        let root = BinaryTreeNode.deserialize(data)!
        
        let sut = BinarySearchTree(root: root)
        
        sut.delete(4)
        
        let serializedFirst = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serializedFirst, [2, 1, 6, 0, nil, 5, 8, nil, nil, nil, nil, 7, 9])
        
        sut.delete(6)
        
        let serializedSecond = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serializedSecond, [2, 1, 7, 0, nil, 5, 8, nil, nil, nil, nil, nil, 9])
        
        sut.delete(7)
        
        let serializedThird = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(serializedThird, [2, 1, 8, 0, nil, 5, 9])
    }
    
    // MARK: Balance
    
    func test_givenAMultiLevelUnbalancedTree_whenIBalanceTheTree_thenNoNodesShouldBeMoved() {
        //Initial Tree:
        //
        //                                                 +---+
        //                       +-------------------------+10 +-------------------------+
        //                       |                         +---+                         |
        //                       |                                                       |
        //                       v                                                       v
        //                     +---+                                                   +---+
        //          +----------+ 7 +----------+                             +----------+14 |
        //          |          +---+          |                             |          +---+
        //          |                         |                             |
        //          v                         v                             v
        //        +---+                     +---+                         +---+
        //   +----+ 5 +----+                | 8 +----+                    |12 |
        //   |    +---+    |                +---+    |                    +---+
        //   |             |                         |
        //   v             v                         v
        // +---+         +---+                     +---+
        // | 3 |         | 6 |                     | 9 |
        // +---+         +---+                     +---+
        //
        //After Balancing
        //
        //                                          +---+
        //                +-------------------------+ 8 +------------------------+
        //                |                         +---+                        |
        //                |                                                      |
        //                v                                                      v
        //              +---+                                                  +---+
        //   +----------+ 5 +----------+                            +----------+10 +----------+
        //   |          +---+          |                            |          +---+          |
        //   |                         |                            |                         |
        //   v                         v                            v                         v
        // +---+                     +---+                        +---+                     +---+
        // | 3 |                     | 6 +----+                   | 9 |                     |12 +----+
        // +---+                     +---+    |                   +---+                     +---+    |
        //                                    |                                                      |
        //                                    v                                                      v
        //                                  +---+                                                  +---+
        //                                  | 7 |                                                  |14 |
        //                                  +---+                                                  +---+
        //
        
        let data = [10, 7, 14, 5, 8, 12, nil, 3, 6, nil, 9]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        sut.balance()
        
        let result = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(result, [8, 5, 10, 3, 6, 9, 12, nil, nil, nil, 7, nil, nil, nil, 14])
    }
    
    func test_givenAMultiLevelUnbalancedTreeWhereAllNodesAreToTheRightOfRoot_whenIBalanceTheTree_thenNodesShouldBeBetterSpread() {
        //Initial Tree:
        //
        // +---+
        // | 1 +------+
        // +---+      |
        //            |
        //            v
        //          +---+
        //          | 2 +------+
        //          +---+      |
        //                     |
        //                     v
        //                   +---+
        //                   | 3 +-----+
        //                   +---+     |
        //                             |
        //                             v
        //                           +---+
        //                           | 4 |
        //                           +---+
        //
        //After Balancing:
        //
        //         +---+
        //   +-----+ 2 +------+
        //   |     +---+      |
        //   |                |
        //   v                v
        // +---+            +---+
        // | 1 |            | 3 +------+
        // +---+            +---+      |
        //                             |
        //                           +---+
        //                           | 4 |
        //                           +---+
        //
        
        let data = [1, nil, 2, nil, 3, nil,4]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        sut.balance()
        
        let result = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(result, [2, 1, 3, nil, nil, nil, 4])
    }
    
    func test_givenAMultiLevelUnbalancedTreeWhereAllNodesAreToTheLeftOfRoot_whenIBalanceTheTree_thenNodesShouldBeBetterSpread() {
        //Initial Tree:
        //
        //                          +---+
        //                    +-----+ 1 |
        //                    |     +---+
        //                    |
        //                    v
        //                  +---+
        //            +-----+ 2 |
        //            |     +---+
        //            |
        //            v
        //          +---+
        //    +-----+ 3 |
        //    |     +---+
        //    |
        //    v
        //  +---+
        //  | 4 |
        //  +---+
        //
        //After Balancing:
        //
        //         +---+
        //   +-----+ 2 +-----+
        //   |     +---+     |
        //   |               |
        //   v               v
        // +---+           +---+
        // | 1 |           | 3 +-----+
        // +---+           +---+     |
        //                           |
        //                         +---+
        //                         | 4 |
        //                         +---+
        //
        
        let data = [4, 3, nil, 2, nil, 1]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        sut.balance()
        
        let result = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(result, [2, 1, 3, nil, nil, nil, 4])
    }
    
    func test_givenAMultiLevelBalancedTree_whenIBalanceTheTree_thenNoNodesShouldBeMoved() {
        //Initial Tree:
        //
        //         +---+
        //   +-----+ 8 +-----+
        //   |     +---+     |
        //   |               |
        //   v               v
        // +---+           +---+
        // | 4 |           | 9 |
        // +---+           +---+
        //
        //
        //After Balancing:
        //
        //         +---+
        //   +-----+ 8 +-----+
        //   |     +---+     |
        //   |               |
        //   v               v
        // +---+           +---+
        // | 4 |           | 9 |
        // +---+           +---+
        //
        
        let data = [8, 4, 9]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        sut.balance()
        
        let result = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(result, [8, 4, 9])
    }
    
    func test_givenASingleLevelBalancedTree_whenIBalanceTheTree_thenNoNodesShouldBeMoved() {
        //Initial Tree:
        //
        // +---+
        // | 8 |
        // +---+
        //
        //
        //After Balancing:
        //
        // +---+
        // | 8 |
        // +---+
        //
        
        let data = [8]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        sut.balance()
        
        let result = BinaryTreeNode.serialize(sut.root)
        
        XCTAssertEqual(result, [8])
    }
    
    // MARK: HeightBalance
    
    func test_givenAMultiLevelBalancedTree_thenIsHeightBalanceReturnsTrue() {
        //Tree:
        //
        //         +---+
        //   +-----+ 8 +-----+
        //   |     +---+     |
        //   |               |
        //   v               v
        // +---+           +---+
        // | 4 |           | 9 |
        // +---+           +---+
        //
        
        let data = [8, 4, 9]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.isHeightBalance()
        
        XCTAssertTrue(result)
    }
    
    func test_givenAMultiLevelUnbalancedTree_thenIsHeightBalanceReturnsFalse() {
        //Tree:
        //
        //                          +---+
        //                    +-----+ 1 |
        //                    |     +---+
        //                    |
        //                    v
        //                  +---+
        //            +-----+ 2 |
        //            |     +---+
        //            |
        //            v
        //          +---+
        //    +-----+ 3 |
        //    |     +---+
        //    |
        //    v
        //  +---+
        //  | 4 |
        //  +---+
        //
        
        let data = [4, 3, nil, 2, nil, 1]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let sut = BinarySearchTree(root: root)
        
        let result = sut.isHeightBalance()
        
        XCTAssertFalse(result)
    }
}
