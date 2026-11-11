// Created 11/11/2026.

import Testing

@testable import LeetCode

struct BinaryTreeMaximumPathSumTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeMaximumPathSum().maxPathSum(root)
        
        #expect(result == 6)
    }
    
    @Test
    func test_B() {
        let data = [-10,9,20,nil,nil,15,7]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeMaximumPathSum().maxPathSum(root)
        
        #expect(result == 42)
    }
    
    @Test
    func test_C() {
        let data = [-10,9,20,nil,nil,15,7,-23,nil,nil,nil,90]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeMaximumPathSum().maxPathSum(root)
        
        #expect(result == 109)
    }
    
    @Test
    func test_D() {
        let data = [-3]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeMaximumPathSum().maxPathSum(root)
        
        #expect(result == -3)
    }
    
    @Test
    func test_E() {
        let data = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeMaximumPathSum().maxPathSum(root)
        
        #expect(result == 48)
    }
}
