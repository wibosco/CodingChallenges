//
//  DeleteNodeInABSTTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/11/2023.
//

import XCTest

@testable import LeetCode

final class DeleteNodeInABSTTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,3,6,2,4,nil,7]
        let key = 3
        let root = BinaryTreeNode.deserialize(data)
        
        let result = DeleteNodeInABST.deleteNode(root, key)
            
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [5,4,6,2,nil,nil,7])
    }
    
    func test_B() {
        let data = [5,3,6,2,4,nil,7]
        let key = 0
        let root = BinaryTreeNode.deserialize(data)
        
        let result = DeleteNodeInABST.deleteNode(root, key)
            
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [5,3,6,2,4,nil,7])
    }
    
    func test_C() {
        let data = [Int]()
        let key = 0
        let root = BinaryTreeNode.deserialize(data)
        
        let result = DeleteNodeInABST.deleteNode(root, key)
            
        XCTAssertNil(result)
    }
}
