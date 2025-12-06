// Created 07/12/2023.


import XCTest

@testable import LeetCode

final class PseudoPalindromicPathsInABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [2,3,1,3,1,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = PseudoPalindromicPathsInABinaryTree().pseudoPalindromicPaths(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [2,1,1,1,3,nil,nil,nil,nil,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = PseudoPalindromicPathsInABinaryTree().pseudoPalindromicPaths(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let data = [9]
        let root = TreeNode.deserialize(data)
        
        let result = PseudoPalindromicPathsInABinaryTree().pseudoPalindromicPaths(root)
        
        XCTAssertEqual(result, 1)
    }
}
