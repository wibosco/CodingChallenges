// Created 27/11/2021.

import XCTest

@testable import LeetCode

final class LowestCommonAncestorBinaryTreeTests: XCTestCase {

    // MARK: - Tests
     
     func test_A() {
         let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
         
         let root = TreeNode.deserialize(data)
         let p = TreeNode(5)
         let q = TreeNode(1)
         
         let result = LowestCommonAncestorBinaryTree().lowestCommonAncestor(root, p, q)
         
         XCTAssertEqual(result?.val, 3)
     }
    
    func test_B() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(5)
        let q = TreeNode(4)
        
        let result = LowestCommonAncestorBinaryTree().lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 5)
    }
    
    func test_C() {
        let data = [1, 2]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(1)
        let q = TreeNode(2)
        
        let result = LowestCommonAncestorBinaryTree().lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 1)
    }
    
    func test_D() {
        let data = [37,-34,-48,nil,-100,-101,48,nil,nil,nil,nil,-54,nil,-71,-22,nil,nil,nil,8]
        
        let root = TreeNode.deserialize(data)
        let p = TreeNode(-71)
        let q = TreeNode(48)
        
        let result = LowestCommonAncestorBinaryTree().lowestCommonAncestor(root, p, q)
        
        XCTAssertEqual(result?.val, 48)
    }
}
