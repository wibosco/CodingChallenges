// Created 15/11/2023.

import XCTest

@testable import LeetCode

final class AddOneRowToTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let val = 1
        let depth = 2
        let data = [4,2,6,3,1,5]
        let root = TreeNode.deserialize(data)
        
        let result = AddOneRowToTree().addOneRow(root, val, depth)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [4,1,1,2,nil,nil,6,3,1,5])
    }
    
    func test_B() {
        let val = 1
        let depth = 3
        let data = [4,2,nil,3,1]
        let root = TreeNode.deserialize(data)
        
        let result = AddOneRowToTree().addOneRow(root, val, depth)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [4,2,nil,1,1,3,nil,nil,1])
    }
}
