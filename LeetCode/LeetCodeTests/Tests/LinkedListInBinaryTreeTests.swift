// Created 16/12/2023.


import XCTest

@testable import LeetCode

final class LinkedListInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let listData = [4,2,8]
        let treeData = [1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3]
        
        let head = ListNode.deserialize(listData)
        let root = TreeNode.deserialize(treeData)
        
        let result = LinkedListInBinaryTree().isSubPath(head, root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let listData = [1,4,2,6]
        let treeData = [1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3]
        
        let head = ListNode.deserialize(listData)
        let root = TreeNode.deserialize(treeData)
        
        let result = LinkedListInBinaryTree().isSubPath(head, root)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let listData = [1,4,2,6,8]
        let treeData = [1,4,4,nil,2,2,nil,1,nil,6,8,nil,nil,nil,nil,1,3]
        
        let head = ListNode.deserialize(listData)
        let root = TreeNode.deserialize(treeData)
        
        let result = LinkedListInBinaryTree().isSubPath(head, root)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let listData = [1,10]
        let treeData = [1,nil,1,10,1,9]
        
        let head = ListNode.deserialize(listData)
        let root = TreeNode.deserialize(treeData)
        
        let result = LinkedListInBinaryTree().isSubPath(head, root)
        
        XCTAssertTrue(result)
    }
}
