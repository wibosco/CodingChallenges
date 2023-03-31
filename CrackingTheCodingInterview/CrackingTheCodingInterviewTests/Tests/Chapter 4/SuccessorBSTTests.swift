//
//  SuccessorBSTTests.swift
//  CrackingTheCodingInterviewTests
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

final class SuccessorBSTTests: XCTestCase {
    var relationships: [[Int]]!
    var root: TreeNodeCtCI!
    
    // MARK - SetUp
    
    override func setUp() {
        super.setUp()
        
        relationships = [[0,1],
                         [0,2],
                         [1,3],
                         [1,4],
                         [2,5],
                         [2,6],
                         [5,7],
                         [5,8]]
        
        root = TreeNodeCtCI.createBinaryTree(fromRelationships: relationships)
    }
    
    override func tearDown() {
        relationships = nil
        root = nil
        super.tearDown()
    }
    
    // MARK: - InOrderPreSorted
    
    func test_A() {
        let successor = SuccessorBST.successorNode(predecessorNode: root)
        
        XCTAssertEqual(successor, root.right!)
    }
    
    func test_B() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.left!)
        
        XCTAssertEqual(successor, root.left!.right)
    }
    
    func test_C() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.left!.right!)
        
        XCTAssertEqual(successor, root)
    }
    
    func test_D() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.right!)
        
        XCTAssertEqual(successor, root.right!.right!)
    }
    
    func test_E() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.right!.right!)
        
        XCTAssertNil(successor)
    }    
}
