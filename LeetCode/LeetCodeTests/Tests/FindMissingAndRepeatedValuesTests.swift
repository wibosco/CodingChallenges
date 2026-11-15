// Created 15/11/2026.

import Testing

@testable import LeetCode

struct FindMissingAndRepeatedValuesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let grid = [
            [1,3],
            [2,2]
        ]
        
        let result = FindMissingAndRepeatedValues().findMissingAndRepeatedValues(grid)
        
        #expect(result == [2,4])
    }
    
    @Test
    func test_B() {
        let grid = [
            [9,1,7],
            [8,9,2],
            [3,4,6]
        ]
        
        let result = FindMissingAndRepeatedValues().findMissingAndRepeatedValues(grid)
        
        #expect(result == [9,5])
    }
}
