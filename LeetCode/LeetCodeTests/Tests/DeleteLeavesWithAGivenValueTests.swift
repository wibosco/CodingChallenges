// Created 15/11/2023.


import XCTest

@testable import LeetCode

final class DeleteLeavesWithAGivenValueTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let target = 2
        let data = [1,2,3,2,nil,2,4]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteLeavesWithAGivenValue().removeLeafNodes(root, target)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,3,nil,4])
    }
    
    func test_B() {
        let target = 3
        let data = [1,3,3,3,2]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteLeavesWithAGivenValue().removeLeafNodes(root, target)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,3,nil,nil,2])
    }
    
    func test_C() {
        let target = 2
        let data = [1,2,nil,2,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteLeavesWithAGivenValue().removeLeafNodes(root, target)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_D() {
        let target = 2
        let data = [2,2,2]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteLeavesWithAGivenValue().removeLeafNodes(root, target)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [Int]())
    }
}
