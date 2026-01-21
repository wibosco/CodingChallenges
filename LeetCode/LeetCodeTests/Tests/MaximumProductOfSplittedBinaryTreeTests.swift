// Created 21/01/2026.

import Testing

@testable import LeetCode

struct MaximumProductOfSplittedBinaryTreeTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,3,4,5,6]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumProductOfSplittedBinaryTree().maxProduct(root)
        
        #expect(result == 110)
    }
    
    @Test
    func test_B() {
        let data = [1,nil,2,3,4,nil,nil,5,6]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumProductOfSplittedBinaryTree().maxProduct(root)
        
        #expect(result == 90)
    }
}
