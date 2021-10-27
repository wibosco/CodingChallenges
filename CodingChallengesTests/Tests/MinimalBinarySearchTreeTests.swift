//
//  MinimalTreeTests.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MinimalBinarySearchTreeTests: XCTestCase {
    
    // MARK: Tests
    
    func test_minimalBinarySearchTreeA() {
        
        let sortedArray = [1,2,3,4,5,6]
        
        let bst = MinimalBinarySearchTree()
        
        bst.constructBinarySearchTreeFromSortedArray(sortedArray: sortedArray)
        
        XCTAssertEqual(4, bst.root?.value)
    }
    
    func test_minimalBinarySearchTreeB() {
        
        let sortedArray = [1,2,3,4,5,6,7,8,9,10,11]
        
        let bst = MinimalBinarySearchTree()
        
        bst.constructBinarySearchTreeFromSortedArray(sortedArray: sortedArray)
        
        XCTAssertEqual(6, bst.root?.value)
    }
    
}
