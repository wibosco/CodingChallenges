// Created 08/05/2025.

import Testing

@testable import LeetCode

struct MinimumPairRemovalToSortArrayITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [5,2,3,1]
        
        let result = MinimumPairRemovalToSortArrayI().minimumPairRemoval(nums)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let nums = [1,2,2]
        
        let result = MinimumPairRemovalToSortArrayI().minimumPairRemoval(nums)
        
        #expect(result == 0)
    }
}
