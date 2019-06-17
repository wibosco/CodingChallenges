//
//  SuccessorBSTTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class SuccessorBSTTests: XCTestCase {
    
    // MARK: Properties
    
    var relationships: [[Int]]!
    var root: SuccessorBSTNode!
    
    // MARK SetUp
    
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
        
        root = SuccessorBSTFactory.buildBinaryTree(relationships: relationships)
    }
    
    override func tearDown() {
        relationships = nil
        root = nil
        super.tearDown()
    }
    
    // MARK: InOrderPreSorted
    
    func test_successorBSTA() {
        let successor = SuccessorBST.successorNode(predecessorNode: root)
        
        XCTAssertEqual(successor, root.right!)
    }
    
    func test_successorBSTB() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.left!)
        
        XCTAssertEqual(successor, root.left!.right)
    }
    
    func test_successorBSTC() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.left!.right!)
        
        XCTAssertEqual(successor, root)
    }
    
    func test_successorBSTD() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.right!)
        
        XCTAssertEqual(successor, root.right!.right!)
    }
    
    func test_successorBSTE() {
        let successor = SuccessorBST.successorNode(predecessorNode: root.right!.right!)
        
        XCTAssertNil(successor)
    }    
}
