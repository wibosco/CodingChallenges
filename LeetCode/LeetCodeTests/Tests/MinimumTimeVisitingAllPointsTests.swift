// Created 25/01/2026.

import Testing

@testable import LeetCode

struct MinimumTimeVisitingAllPointsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let points = [[1,1],[3,4],[-1,0]]
        
        let result = MinimumTimeVisitingAllPoints().minTimeToVisitAllPoints(points)
        
        #expect(result == 7)
    }
    
    @Test
    func test_B() {
        let points = [[3,2],[-2,2]]
        
        let result = MinimumTimeVisitingAllPoints().minTimeToVisitAllPoints(points)
        
        #expect(result == 5)
    }
}
