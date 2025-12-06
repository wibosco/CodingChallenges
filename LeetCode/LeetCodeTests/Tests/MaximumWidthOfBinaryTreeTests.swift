// Created 17/11/2023.


import XCTest

@testable import LeetCode

final class MaximumWidthOfBinaryTreeTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let data = [1,3,2,5,3,nil,9]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumWidthOfBinaryTree().widthOfBinaryTree(root)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let data = [1,3,2,5,nil,nil,9,6,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumWidthOfBinaryTree().widthOfBinaryTree(root)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let data = [1,3,2,5]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumWidthOfBinaryTree().widthOfBinaryTree(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_D() {
        let data = [1,nil,3,nil,2,5,4]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumWidthOfBinaryTree().widthOfBinaryTree(root)
        
        XCTAssertEqual(result, 2)
    }
}
