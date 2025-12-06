// Created 18/11/2021.


import XCTest

@testable import LeetCode

final class FindMinimumRotatedSortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 4, 5, 1, 2]
        
        let result = FindMinimumRotatedSortedArray().findMin(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let nums = [4, 5, 6, 7, 0, 1, 2]
        
        let result = FindMinimumRotatedSortedArray().findMin(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums = [11, 13, 15, 17]
        
        let result = FindMinimumRotatedSortedArray().findMin(nums)
        
        XCTAssertEqual(result, 11)
    }
}
