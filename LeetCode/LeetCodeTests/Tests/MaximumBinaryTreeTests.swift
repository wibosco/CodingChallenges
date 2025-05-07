// Created 07/05/2025.

import Testing

@testable import LeetCode

struct MaximumBinaryTreeTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [3,2,1,6,0,5]
        
        let result = MaximumBinaryTree().constructMaximumBinaryTree(nums)
        let values = TreeNode.serialize(result)
        
        #expect(values == [6,3,5,nil,2,0,nil,nil,1])
    }
    
    @Test
    func test_B() {
        let nums = [3,2,1]
        
        let result = MaximumBinaryTree().constructMaximumBinaryTree(nums)
        let values = TreeNode.serialize(result)
        
        #expect(values == [3,nil,2,nil,1])
    }
}
