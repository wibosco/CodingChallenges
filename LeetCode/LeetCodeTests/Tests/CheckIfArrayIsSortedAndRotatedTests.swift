// Created 28/01/2026.

import Testing

@testable import LeetCode

struct CheckIfArrayIsSortedAndRotatedTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [3,4,5,1,2]
        
        let result = CheckIfArrayIsSortedAndRotated().check(nums)
        
        #expect(result == true)
    }
    
    @Test
    func test_B() {
        let nums = [2,1,3,4]
        
        let result = CheckIfArrayIsSortedAndRotated().check(nums)
        
        #expect(result == false)
    }
    
    @Test
    func test_C() {
        let nums = [1,2,3]
        
        let result = CheckIfArrayIsSortedAndRotated().check(nums)
        
        #expect(result == true)
    }
    
    @Test
    func test_D() {
        let nums = [6]
        
        let result = CheckIfArrayIsSortedAndRotated().check(nums)
        
        #expect(result == true)
    }
}
