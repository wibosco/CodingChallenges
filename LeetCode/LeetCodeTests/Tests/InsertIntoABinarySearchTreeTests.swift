// Created 15/11/2023.

import XCTest

@testable import LeetCode

final class InsertIntoABinarySearchTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let val = 5
        let data = [4,2,7,1,3]
        let root = TreeNode.deserialize(data)
        
        let result = InsertIntoABinarySearchTree().insertIntoBST(root, val)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [4,2,7,1,3,5])
    }
    
    func test_B() {
        let val = 25
        let data = [40,20,60,10,30,50,70]
        let root = TreeNode.deserialize(data)
        
        let result = InsertIntoABinarySearchTree().insertIntoBST(root, val)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [40,20,60,10,30,50,70,nil,nil,25])
    }
}
