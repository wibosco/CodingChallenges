// Created 07/08/2025.

import Testing

@testable import LeetCode

struct ThreeSumSmallerTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [-2,0,1,3]
        let target = 2
            
        let result = ThreeSumSmaller().threeSumSmaller(nums, target)
        
        #expect(result == 2)
    }
    
    @Test
    func test_B() {
        let nums = [Int]()
        let target = 0
            
        let result = ThreeSumSmaller().threeSumSmaller(nums, target)
        
        #expect(result == 0)
    }
    
    @Test
    func test_C() {
        let nums = [0]
        let target = 0
            
        let result = ThreeSumSmaller().threeSumSmaller(nums, target)
        
        #expect(result == 0)
    }
}
