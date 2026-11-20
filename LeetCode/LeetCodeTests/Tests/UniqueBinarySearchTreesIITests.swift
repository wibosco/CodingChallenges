// Created 20/11/2026.

import Testing

@testable import LeetCode

struct UniqueBinarySearchTreesIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 3
        
        let result = UniqueBinarySearchTreesII().generateTrees(n)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedTrees = [
            [1,nil,2,nil,3],
            [1,nil,3,2],
            [2,1,3],
            [3,1,nil,nil,2],
            [3,2,nil,1]
        ]
            
        #expect(values == expectedTrees)
    }
    
    @Test
    func test_B() {
        let n = 1
        
        let result = UniqueBinarySearchTreesII().generateTrees(n)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedTrees = [
            [1]
        ]
            
        #expect(values == expectedTrees)
    }
}
