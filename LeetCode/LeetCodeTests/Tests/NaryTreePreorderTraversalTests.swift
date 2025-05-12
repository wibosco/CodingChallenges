// Created 12/05/2025.

import Testing

@testable import LeetCode

struct NaryTreePreorderTraversalTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,nil,3,2,4,nil,5,6]
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreePreorderTraversal().preorder(root)
        
        #expect(result == [1,3,5,6,2,4])
    }
    
    @Test
    func test_B() {
        let data = [1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14]
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreePreorderTraversal().preorder(root)
        
        #expect(result == [1,2,3,6,7,11,14,4,8,12,5,9,13,10])
    }
}
