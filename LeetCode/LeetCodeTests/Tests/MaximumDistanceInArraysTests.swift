// Created 05/12/2025.

import Testing

@testable import LeetCode

struct MaximumDistanceInArraysTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let arrays = [[1,2,3],[4,5],[1,2,3]]
        
        let result = MaximumDistanceInArrays().maxDistance(arrays)
        
        #expect(result == 4)
    }
    
    @Test
    func test_B() {
        let arrays = [[1],[1]]
        
        let result = MaximumDistanceInArrays().maxDistance(arrays)
        
        #expect(result == 0)
    }
    
    @Test
    func test_C() {
        let arrays = [[1,4],[0,5]]
        
        let result = MaximumDistanceInArrays().maxDistance(arrays)
        
        #expect(result == 4)
    }
}
