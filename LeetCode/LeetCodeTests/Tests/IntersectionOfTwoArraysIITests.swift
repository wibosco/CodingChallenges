// Created 20/11/2021.


import XCTest

@testable import LeetCode

final class IntersectionOfTwoArraysIITests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums1 = [1, 2, 2, 1]
        let nums2 = [2, 2]
        
        let result = IntersectionOfTwoArraysII().intersect(nums1, nums2)
        
        XCTAssertEqual(result, [2, 2])
    }
    
    func test_B() {
        let nums1 = [4, 9, 5]
        let nums2 = [9, 4, 9, 8, 4]
        
        let result = IntersectionOfTwoArraysII().intersect(nums1, nums2)
        
        XCTAssertEqual(result, [4, 9])
    }
    
    func test_C() {
        let nums1 = [1, 2, 2, 1]
        let nums2 = [2]
        
        let result = IntersectionOfTwoArraysII().intersect(nums1, nums2)
        
        XCTAssertEqual(result, [2])
    }
}
