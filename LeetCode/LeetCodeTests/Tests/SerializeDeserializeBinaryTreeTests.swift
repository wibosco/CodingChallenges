//
//  SerializeDeserializeBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SerializeDeserializeBinaryTreeTests: XCTestCase {
    
    // MARK: - Deserialize
    
    func test_A() {
        let data = [1, 2, 3, nil, nil, 4, 5]
        
        let tree = SerializeDeserializeBinaryTree.deserialize(data)
        let values = SerializeDeserializeBinaryTree.serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_B() {
        let data = [Int]()
        
        let tree = SerializeDeserializeBinaryTree.deserialize(data)
        let values = SerializeDeserializeBinaryTree.serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_C() {
        let data = [1]
        
        let tree = SerializeDeserializeBinaryTree.deserialize(data)
        let values = SerializeDeserializeBinaryTree.serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_D() {
        let data = [1, 2]
        
        let tree = SerializeDeserializeBinaryTree.deserialize(data)
        let values = SerializeDeserializeBinaryTree.serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_E() {
        let data = [1, 2, 3, nil, 4, 5, 6]
        
        let tree = SerializeDeserializeBinaryTree.deserialize(data)
        let values = SerializeDeserializeBinaryTree.serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
}
