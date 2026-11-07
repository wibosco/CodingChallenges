// Created 07/11/2026.

import Testing

@testable import LeetCode

struct MedianOfTwoSortedArraysTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums1 = [1,3]
        let nums2 = [2]
        
        let result = MedianOfTwoSortedArrays().findMedianSortedArrays(nums1, nums2)
        
        #expect(result == 2.0)
    }
    
    @Test
    func test_B() {
        let nums1 = [1,2]
        let nums2 = [3,4]
        
        let result = MedianOfTwoSortedArrays().findMedianSortedArrays(nums1, nums2)
        
        #expect(result == 2.5)
    }
}
