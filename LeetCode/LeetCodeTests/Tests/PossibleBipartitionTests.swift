// Created 04/12/2025.

import Testing

@testable import LeetCode

struct PossibleBipartitionTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let n = 4
        let dislikes = [[1,2],[1,3],[2,4]]
        
        let result = PossibleBipartition().possibleBipartition(n, dislikes)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let n = 3
        let dislikes = [[1,2],[1,3],[2,3]]
        
        let result = PossibleBipartition().possibleBipartition(n, dislikes)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let n = 10
        let dislikes = [[1,2],[3,4],[5,6],[6,7],[8,9],[7,8]]
        
        let result = PossibleBipartition().possibleBipartition(n, dislikes)
        
        #expect(result == true)
    }
}
