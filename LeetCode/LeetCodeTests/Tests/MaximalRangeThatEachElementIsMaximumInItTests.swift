// Created 12/05/2025.

import Testing

@testable import LeetCode

struct MaximalRangeThatEachElementIsMaximumInItTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,5,4,3,6]
        
        let result = MaximalRangeThatEachElementIsMaximumInIt().maximumLengthOfRanges(nums)
        
        #expect(result == [1,4,2,1,5])
    }
    
    @Test
    func test_B() {
        let nums = [1,2,3,4,5]
        
        let result = MaximalRangeThatEachElementIsMaximumInIt().maximumLengthOfRanges(nums)
        
        #expect(result == [1,2,3,4,5])
    }
}
