// Created 07/05/2025.

import Testing

@testable import LeetCode

struct MaximumBinaryTreeIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let root = TreeNode.deserialize([4,1,3,nil,nil,2])
        let val = 5
            
        let result = MaximumBinaryTreeII().insertIntoMaxTree(root, val)
        let values = TreeNode.serialize(result)
        
        #expect(values == [5,4,nil,1,3,nil,nil,2])
    }
    
    @Test
    func test_B() {
        let root = TreeNode.deserialize([5,2,4,nil,1])
        let val = 3
            
        let result = MaximumBinaryTreeII().insertIntoMaxTree(root, val)
        let values = TreeNode.serialize(result)
        
        #expect(values == [5,2,4,nil,1,nil,3])
    }
    
    @Test
    func test_C() {
        let root = TreeNode.deserialize([5,2,3,nil,1])
        let val = 4
            
        let result = MaximumBinaryTreeII().insertIntoMaxTree(root, val)
        let values = TreeNode.serialize(result)
        
        #expect(values == [5,2,4,nil,1,3])
    }
}
