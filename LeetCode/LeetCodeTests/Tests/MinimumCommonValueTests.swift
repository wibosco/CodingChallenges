// Created 01/03/2024.

import XCTest

@testable import LeetCode

final class MinimumCommonValueTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums1 = [1,2,3]
        let nums2 = [2,4]
        
        let result = MinimumCommonValue().getCommon(nums1, nums2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums1 = [1,2,3,6]
        let nums2 = [2,3,4,5]
        
        let result = MinimumCommonValue().getCommon(nums1, nums2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let nums1 = [1,2]
        let nums2 = [3,4]
        
        let result = MinimumCommonValue().getCommon(nums1, nums2)
        
        XCTAssertEqual(result, -1)
    }
}
