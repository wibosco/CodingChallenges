// Created 07/05/2025.

import Testing

@testable import LeetCode

struct NumberOfNodesWithValueOneTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 5
        let queries = [1,2,5]
            
        let result = NumberOfNodesWithValueOne().numberOfNodes(n, queries)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let n = 3
        let queries = [2,3,3]
            
        let result = NumberOfNodesWithValueOne().numberOfNodes(n, queries)
        
        #expect(result == 1)
    }
}
