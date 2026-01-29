// Created 19/11/2021.

import XCTest

@testable import LeetCode

final class FindMinimumRotatedSortedArrayIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 4, 5, 1, 2]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let nums = [4, 5, 6, 7, 0, 1, 2]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums = [11, 13, 15, 17]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 11)
    }
    
    func test_D() {
        let nums = [1, 3, 5]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_E() {
        let nums = [2, 2, 2, 0, 1]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_F() {
        let nums = [2, 2, 2, 2, 2, 2, 0, 1]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_G() {
        let nums = [3, 3, 1, 3]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_H() {
        let nums = [1, 3, 3]
        
        let result = FindMinimumRotatedSortedArrayII().findMin(nums)
        
        XCTAssertEqual(result, 1)
    }
}
