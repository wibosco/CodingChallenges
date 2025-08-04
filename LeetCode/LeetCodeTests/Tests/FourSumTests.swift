// Created 04/08/2025.

import Testing

@testable import LeetCode

struct FourSumTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [1,0,-1,0,-2,2]
        let target = 0
            
        let result = FourSum().fourSum(nums, target)
        
        let expectedResult = [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
        
        #expect(result.count == 3)
        
        //order isn't important
        for r in result {
            #expect(expectedResult.contains(r) == true)
        }
    }
    
    @Test
    func test_B() {
        let nums = [2,2,2,2,2]
        let target = 8
            
        let result = FourSum().fourSum(nums, target)
        
        let expectedResult = [[2,2,2,2]]
        
        #expect(result.count == 1)
        
        //order isn't important
        for r in result {
            #expect(expectedResult.contains(r) == true)
        }
    }
}
