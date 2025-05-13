// Created 13/05/2025.

import Testing

@testable import LeetCode

struct ConstructBinarySearchTreeFromPreorderTraversalTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let preorder = [8,5,1,7,10,12]
        
        let result = ConstructBinarySearchTreeFromPreorderTraversal().bstFromPreorder(preorder)
        let values = TreeNode.serialize(result)
        
        #expect(values == [8,5,10,1,7,nil,12])
    }
    
    @Test
    func test_B() {
        let preorder = [1,3]
        
        let result = ConstructBinarySearchTreeFromPreorderTraversal().bstFromPreorder(preorder)
        let values = TreeNode.serialize(result)
        
        #expect(values == [1,nil,3])
    }
}
