// Created 23/02/2024.

import XCTest

@testable import LeetCode

final class ClosestNodesQueriesInABinarySearchTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [6,2,13,1,4,9,15,nil,nil,nil,nil,nil,nil,14]
        let queries = [2,5,16]
        
        let root = TreeNode.deserialize(data)
        
        let result = ClosestNodesQueriesInABinarySearchTree().closestNodes(root, queries)
        
        XCTAssertEqual(result, [[2,2],[4,6],[15,-1]])
    }
    
    func test_B() {
        let data = [4,nil,9]
        let queries = [3]
        
        let root = TreeNode.deserialize(data)
        
        let result = ClosestNodesQueriesInABinarySearchTree().closestNodes(root, queries)
        
        XCTAssertEqual(result, [[-1,4]])
    }
    
    func test_C() {
        let data = [16,8,18,1,12,nil,20,nil,2,9,nil,nil,nil,nil,7]
        let queries = [8,14,285508,6]
        
        let root = TreeNode.deserialize(data)
        
        let result = ClosestNodesQueriesInABinarySearchTree().closestNodes(root, queries)
        
        XCTAssertEqual(result, [[8,8],[12,16],[20,-1],[2,7]])
    }
    
    func test_D() {
        let data = [16,14,nil,4,15,1]
        let queries = [10,6,2,9]
        
        let root = TreeNode.deserialize(data)
        
        let result = ClosestNodesQueriesInABinarySearchTree().closestNodes(root, queries)
        
        XCTAssertEqual(result, [[4,14],[4,14],[1,4],[4,14]])
    }
    
    func test_E() {
        let data = [9,6,14,nil,nil,13,20,12]
        let queries = [19,10,9,17,19,6,10,19,13,6]
        
        let root = TreeNode.deserialize(data)
        
        let result = ClosestNodesQueriesInABinarySearchTree().closestNodes(root, queries)
        
        XCTAssertEqual(result, [[14,20],[9,12],[9,9],[14,20],[14,20],[6,6],[9,12],[14,20],[13,13],[6,6]])
    }
}
