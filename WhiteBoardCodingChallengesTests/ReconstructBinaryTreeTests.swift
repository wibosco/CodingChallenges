//
//  BinaryTreeTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ReconstructBinaryTreeTests: XCTestCase {
    
    // MARK: Tests
    
    func test_binaryTreeA() {
        
        let nodeList = [[2, 4],
                        [1, 2],
                        [3, 6],
                        [1, 3],
                        [2, 5]]
        
        let binaryTree = ReconstructBinaryTree()
        
        let firstNode = binaryTree.reconstructTree(deconstructedTree: nodeList)
        
        XCTAssertEqual(firstNode.value, 1)
    }

}
