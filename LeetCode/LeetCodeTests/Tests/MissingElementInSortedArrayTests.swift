// Created 31/05/2025.

import Testing

@testable import LeetCode

struct MissingElementInSortedArrayTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [4,7,9,10]
        let k = 1
        
        let result = MissingElementInSortedArray().missingElement(nums, k)
        
        #expect(result == 5)
    }
    
    @Test
    func test_B() {
        let nums = [4,7,9,10]
        let k = 3
        
        let result = MissingElementInSortedArray().missingElement(nums, k)
        
        #expect(result == 8)
    }
    
    @Test
    func test_C() {
        let nums = [1,2,4]
        let k = 3
        
        let result = MissingElementInSortedArray().missingElement(nums, k)
        
        #expect(result == 6)
    }
}
