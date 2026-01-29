// Created 28/12/2021.

import XCTest

@testable import LeetCode

final class KthLargestElementInArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 2, 1, 5, 6, 4]
        let k = 2
        
        let result = KthLargestElementInArray().findKthLargest(nums, k)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let nums = [3, 2, 3, 1, 2, 4, 5, 5, 6]
        let k = 4
        
        let result = KthLargestElementInArray().findKthLargest(nums, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let nums = [2, 1]
        let k = 1
        
        let result = KthLargestElementInArray().findKthLargest(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_D() {
        let nums = [3, 1, 2, 4]
        let k = 2
        
        let result = KthLargestElementInArray().findKthLargest(nums, k)
        
        XCTAssertEqual(result, 3)
    }
}
