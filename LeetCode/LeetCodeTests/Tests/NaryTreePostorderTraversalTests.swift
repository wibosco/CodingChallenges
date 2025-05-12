// Created 12/05/2025.

import Testing

@testable import LeetCode

struct NaryTreePostorderTraversalTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,nil,3,2,4,nil,5,6]
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreePostorderTraversal().postorder(root)
        
        #expect(result == [5,6,3,2,4,1])
    }
    
    @Test
    func test_B() {
        let data = [1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14]
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreePostorderTraversal().postorder(root)
        
        #expect(result == [2,6,14,11,7,3,12,8,4,13,9,10,5,1])
    }
}
