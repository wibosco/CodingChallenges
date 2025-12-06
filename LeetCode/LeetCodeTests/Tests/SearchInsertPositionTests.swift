// Created 20/01/2022.


import XCTest

@testable import LeetCode

final class SearchInsertPositionTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 3, 5, 6]
        let target = 5
        
        let result = SearchInsertPosition().searchInsert(nums, target)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [1, 3, 5, 6]
        let target = 2
        
        let result = SearchInsertPosition().searchInsert(nums, target)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let nums = [1, 3, 5, 6]
        let target = 7
        
        let result = SearchInsertPosition().searchInsert(nums, target)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let nums = [1]
        let target = 1
        
        let result = SearchInsertPosition().searchInsert(nums, target)
        
        XCTAssertEqual(result, 0)
    }
}
