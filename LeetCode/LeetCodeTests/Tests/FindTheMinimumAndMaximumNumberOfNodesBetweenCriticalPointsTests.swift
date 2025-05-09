// Created 09/05/2025.

import Testing

@testable import LeetCode

struct FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPointsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [3,1]
        let head = ListNode.deserialize(data)
        
        let result = FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints().nodesBetweenCriticalPoints(head)
        
        #expect(result == [-1,-1])
    }
    
    @Test
    func test_B() {
        let data = [5,3,1,2,5,1,2]
        let head = ListNode.deserialize(data)
        
        let result = FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints().nodesBetweenCriticalPoints(head)
        
        #expect(result == [1,3])
    }
    
    @Test
    func test_C() {
        let data = [1,3,2,2,3,2,2,2,7]
        let head = ListNode.deserialize(data)
        
        let result = FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints().nodesBetweenCriticalPoints(head)
        
        #expect(result == [3,3])
    }
}
