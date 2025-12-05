// Created 05/12/2025.

import Testing

@testable import LeetCode

struct MinimumAbsoluteDistanceBetweenMirrorPairsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [12,21,45,33,54]
        
        let result = MinimumAbsoluteDistanceBetweenMirrorPairs().minMirrorPairDistance(nums)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let nums = [120,21]
        
        let result = MinimumAbsoluteDistanceBetweenMirrorPairs().minMirrorPairDistance(nums)
        
        #expect(result == 1)
    }
    
    @Test
    func test_C() {
        let nums = [21,120]
        
        let result = MinimumAbsoluteDistanceBetweenMirrorPairs().minMirrorPairDistance(nums)
        
        #expect(result == -1)
    }
}
