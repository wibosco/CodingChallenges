// Created 05/12/2025.

import Testing

@testable import LeetCode

struct CountPartitionsWithEvenSumDifferenceTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [10,10,3,7,6]
        
        let result = CountPartitionsWithEvenSumDifference().countPartitions(nums)
        
        #expect(result == 4)
    }
    
    @Test
    func test_B() {
        let nums = [1,2,2]
        
        let result = CountPartitionsWithEvenSumDifference().countPartitions(nums)
        
        #expect(result == 0)
    }
    
    @Test
    func test_C() {
        let nums = [2,4,6,8]
        
        let result = CountPartitionsWithEvenSumDifference().countPartitions(nums)
        
        #expect(result == 3)
    }
}
