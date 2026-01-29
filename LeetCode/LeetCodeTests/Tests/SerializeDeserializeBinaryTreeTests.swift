// Created 03/12/2021.

import XCTest

@testable import LeetCode

final class SerializeDeserializeBinaryTreeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, nil, nil, 4, 5]
        
        let tree = SerializeDeserializeBinaryTree().deserialize(data)
        let values = SerializeDeserializeBinaryTree().serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_B() {
        let data = [Int]()
        
        let tree = SerializeDeserializeBinaryTree().deserialize(data)
        let values = SerializeDeserializeBinaryTree().serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_C() {
        let data = [1]
        
        let tree = SerializeDeserializeBinaryTree().deserialize(data)
        let values = SerializeDeserializeBinaryTree().serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_D() {
        let data = [1, 2]
        
        let tree = SerializeDeserializeBinaryTree().deserialize(data)
        let values = SerializeDeserializeBinaryTree().serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
    func test_E() {
        let data = [1, 2, 3, nil, 4, 5, 6]
        
        let tree = SerializeDeserializeBinaryTree().deserialize(data)
        let values = SerializeDeserializeBinaryTree().serialize(tree)
        
        XCTAssertEqual(values, data)
    }
    
}
