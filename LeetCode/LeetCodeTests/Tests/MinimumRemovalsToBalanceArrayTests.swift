// Created 14/02/2026.

import Testing

@testable import LeetCode

struct MinimumRemovalsToBalanceArrayTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [2,1,5]
        let k = 2
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 1)
    }
    
    @Test
    func test_B() {
        let nums = [1,6,2,9]
        let k = 3
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 2)
    }
    
    @Test
    func test_C() {
        let nums = [4,6]
        let k = 2
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 0)
    }
    
    @Test
    func test_D() {
        let nums = [8]
        let k = 1
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 0)
    }
    
    @Test
    func test_E() {
        let nums = [2, 12]
        let k = 2
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 1)
    }
    
    @Test
    func test_F() {
        let nums = [9514,4037,4183,20670,24972,13008,31534,34223,22722,7793,15527,37410,28870,7506,3485,19748,26934,333,38955,831,6658,24063,10075,14595,15246,5715,3382,27295,6093,24611,14191,31204,14631,12630]
        let k = 1
        
        let result = MinimumRemovalsToBalanceArray().minRemoval(nums, k)
        
        #expect(result == 33)
    }
}
