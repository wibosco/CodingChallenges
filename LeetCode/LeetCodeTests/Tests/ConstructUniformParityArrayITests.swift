// Created 15/11/2026.

import Testing

@testable import LeetCode

struct ConstructUniformParityArrayITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums1 = [2,3]
        
        let result = ConstructUniformParityArrayI().uniformArray(nums1)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let nums1 = [4,6]
        
        let result = ConstructUniformParityArrayI().uniformArray(nums1)
        
        #expect(result == true)
    }
}
