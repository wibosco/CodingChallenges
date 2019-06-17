//
//  BinarySearchTreeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 31/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class BinarySearchTreeTests: XCTestCase {
    
    // MARK: Properties
    
    let values = [14, 4, 16, 7, 8, 2, 5, 23, 1, 6, 19]
    
    var binarySearchTree: BinarySearchTree?
    var populatedBinarySearchTree: BinarySearchTree?
    
    // MARK: TestLifecycle
    
    override func setUp() {
        
        super.setUp()
        
        binarySearchTree = BinarySearchTree()
        
        populatedBinarySearchTree = BinarySearchTree()
        
        for value in values {
            
            populatedBinarySearchTree!.addValue(value: value)
        }
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        binarySearchTree = nil
        populatedBinarySearchTree = nil
    }
    
    
    // MARK: Add
    
    func test_addRoot() {
        
        for value in values {
            
            self.binarySearchTree!.addValue(value: value)
        }
        
        XCTAssertEqual(self.values[0], self.binarySearchTree!.root!.value)
    }
    
    // MARK: Traversal
    
    func test_preOrderTraversal() {
        
        let expectedOrdering = "14, 4, 2, 1, 7, 5, 6, 8, 16, 23, 19"
        
        XCTAssertEqual(expectedOrdering, self.populatedBinarySearchTree?.preOrderTraversal())
    }
    
    func test_inOrderTraversal() {
        
        let expectedOrdering = "1, 2, 4, 5, 6, 7, 8, 14, 16, 19, 23"
        
        XCTAssertEqual(expectedOrdering, self.populatedBinarySearchTree?.inOrderTraversal())
    }
    
    func test_postOrderTraversal() {
        
        let expectedOrdering = "1, 2, 6, 5, 8, 7, 4, 19, 23, 16, 14"
        
        XCTAssertEqual(expectedOrdering, self.populatedBinarySearchTree?.postOrderTraversal())
    }
    
    func test_levelTraversal() {
        
        let expectedOrdering = "14, 4, 16, 2, 7, 23, 1, 5, 8, 19, 6"
        
        XCTAssertEqual(expectedOrdering, self.populatedBinarySearchTree?.levelTraversal())
    }
    
}
