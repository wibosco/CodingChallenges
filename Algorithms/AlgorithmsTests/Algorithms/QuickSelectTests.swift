// Created 03/09/2025.

import Testing

@testable import Algorithms

struct QuickSelectTests {

    // MARK: - Tests
    
    // MARK: Smallest
    
    @Test
    func test_smallest_A() {
        let nums = [3,2,1,5,6,4]
        let k = 2
        
        let result = QuickSelect().findKthSmallest(nums, k)
        
        #expect(result == 2)
    }
    
    @Test
    func test_smallest_B() {
        let nums = [3,2,1,1,5,6,6,4]
        let k = 2
        
        let result = QuickSelect().findKthSmallest(nums, k)
        
        #expect(result == 1)
    }
    
    @Test
    func test_smallest_C() {
        let nums = [12,18,23,87]
        let k = 2
        
        let result = QuickSelect().findKthSmallest(nums, k)
        
        #expect(result == 18)
    }
    
    // MARK: Largest
    
    @Test
    func test_largest_A() {
        let nums = [3,2,1,5,6,4]
        let k = 2
        
        let result = QuickSelect().findKthLargest(nums, k)
        
        #expect(result == 5)
    }
    
    @Test
    func test_largest_B() {
        let nums = [3,2,1,1,5,6,6,4]
        let k = 2
        
        let result = QuickSelect().findKthLargest(nums, k)
        
        #expect(result == 6)
    }
    
    @Test
    func test_largest_C() {
        let nums = [12,18,23,87]
        let k = 2
        
        let result = QuickSelect().findKthLargest(nums, k)
        
        #expect(result == 23)
    }
}
