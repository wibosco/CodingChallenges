// Created 01/06/2025.

import Testing

@testable import LeetCode

struct AANextGreaterElementIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,2,1]
        
        let result = NextGreaterElementII().nextGreaterElements(nums)
        
        #expect(result == [2,-1,2])
    }
    
    @Test
    func test_B() {
        let nums = [1,2,3,4,3]
        
        let result = NextGreaterElementII().nextGreaterElements(nums)
        
        #expect(result == [2,3,4,-1,4])
    }
}
