// Created 06/05/2025.

import Testing

@testable import LeetCode

struct CountUnreachablePairsOfNodesInAnUndirectedGraphTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 3
        let edges = [[0,1],[0,2],[1,2]]
            
        let result = CountUnreachablePairsOfNodesInAnUndirectedGraph().countPairs(n, edges)
        
        #expect(result == 0)
    }
    
    @Test
    func test_B() {
        let n = 7
        let edges = [[0,2],[0,5],[2,4],[1,6],[5,4]]
            
        let result = CountUnreachablePairsOfNodesInAnUndirectedGraph().countPairs(n, edges)
        
        #expect(result == 14)
    }
    
    @Test
    func test_C() {
        let n = 12
        let edges = [[Int]]()
            
        let result = CountUnreachablePairsOfNodesInAnUndirectedGraph().countPairs(n, edges)
        
        #expect(result == 66)
    }
    
    @Test
    func test_D() {
        let n = 100000
        let edges = [[Int]]()
            
        let result = CountUnreachablePairsOfNodesInAnUndirectedGraph().countPairs(n, edges)
        
        #expect(result == 4999950000)
    }
}
