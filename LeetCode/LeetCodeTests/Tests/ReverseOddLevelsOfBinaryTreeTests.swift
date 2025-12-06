// Created 15/11/2023.


import XCTest

@testable import LeetCode

final class ReverseOddLevelsOfBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [2,3,5,8,13,21,34]
        let root = TreeNode.deserialize(data)
        
        let result = ReverseOddLevelsOfBinaryTree().reverseOddLevels(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [2,5,3,8,13,21,34])
    }
    
    func test_B() {
        let data = [7,13,11]
        let root = TreeNode.deserialize(data)
        
        let result = ReverseOddLevelsOfBinaryTree().reverseOddLevels(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [7,11,13])
    }
    
    func test_C() {
        let data = [0,1,2,0,0,0,0,1,1,1,1,2,2,2,2]
        let root = TreeNode.deserialize(data)
        
        let result = ReverseOddLevelsOfBinaryTree().reverseOddLevels(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [0,2,1,0,0,0,0,2,2,2,2,1,1,1,1])
    }
}
