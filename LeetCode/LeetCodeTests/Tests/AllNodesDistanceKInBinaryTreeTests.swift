// Created 11/07/2023.


import XCTest

@testable import LeetCode

final class AllNodesDistanceKInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
        let root = TreeNode.deserialize(data)!
        let targetValue = 5
        let target = dfs(root, targetValue)
        let k = 2
        
        let result = AllNodesDistanceKInBinaryTree().distanceK(root, target, k)
        
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result, [7, 4, 1])
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)!
        let targetValue = 1
        let target = dfs(root, targetValue)
        let k = 3
        
        let result = AllNodesDistanceKInBinaryTree().distanceK(root, target, k)
        
        XCTAssertEqual(result.count, 0)
        XCTAssertEqual(result, [])
    }
    
    func test_C() {
        let data = [0, 2, 1, nil, nil, 3]
        let root = TreeNode.deserialize(data)!
        let targetValue = 3
        let target = dfs(root, targetValue)
        let k = 3
        
        let result = AllNodesDistanceKInBinaryTree().distanceK(root, target, k)
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result, [2])
    }
}

extension AllNodesDistanceKInBinaryTreeTests {
    
    func dfs(_ node: TreeNode?, _ value: Int) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        
        guard node.val != value else {
            return node
        }
        
        var target = dfs(node.left, value)
        
        if target == nil {
            target = dfs(node.right, value)
        }
        
        return target
    }
}
