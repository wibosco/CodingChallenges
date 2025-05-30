// Created 30/05/2025.

import Testing

@testable import LeetCode

struct IntervalListIntersectionsTest {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let firstList = [[0,2],[5,10],[13,23],[24,25]]
        let secondList = [[1,5],[8,12],[15,24],[25,26]]
        
        let result = IntervalListIntersections().intervalIntersection(firstList, secondList)
        
        #expect(result == [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]])
    }
    
    @Test
    func test_B() {
        let firstList = [[1,3],[5,9]]
        let secondList = [[Int]]()
        
        let result = IntervalListIntersections().intervalIntersection(firstList, secondList)
        
        #expect(result == [[Int]]())
    }
    
    @Test
    func test_C() {
        let firstList = [[8,15]]
        let secondList = [[2,6],[8,10],[12,20]]
        
        let result = IntervalListIntersections().intervalIntersection(firstList, secondList)
        
        #expect(result == [[8,10],[12,15]])
    }
}
