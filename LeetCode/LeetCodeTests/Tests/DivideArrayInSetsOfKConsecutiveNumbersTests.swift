// Created 04/07/2023.


import XCTest

@testable import LeetCode

final class DivideArrayInSetsOfKConsecutiveNumbersTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 3, 4, 4, 5, 6]
        let k = 4
        
        let result = DivideArrayInSetsOfKConsecutiveNumbers().isPossibleDivide(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [3, 2, 1, 2, 3, 4, 3, 4, 5, 9, 10, 11]
        let k = 3
        
        let result = DivideArrayInSetsOfKConsecutiveNumbers().isPossibleDivide(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let nums = [1, 2, 3, 4]
        let k = 3
        
        let result = DivideArrayInSetsOfKConsecutiveNumbers().isPossibleDivide(nums, k)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let nums = [16, 21, 26, 35]
        let k = 4
        
        let result = DivideArrayInSetsOfKConsecutiveNumbers().isPossibleDivide(nums, k)
        
        XCTAssertFalse(result)
    }
}
