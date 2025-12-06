// Created 28/07/2023.


import XCTest

@testable import LeetCode

final class OneThreeTwoPatternTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_B() {
        let nums = [3, 1, 4, 2]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let nums = [-1, 3, 2, 0]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let nums = [1, 0, 1, -4, -3]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let nums = [-2, 1, 2, -2, 1, 2] //[-2, 2, 1]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_F() {
        let nums = [3, 5, 0, 3, 4] //[3, 5, 4]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_G() {
        let nums = [-2, 1, 1]
        
        let result = OneThreeTwoPattern().find132pattern(nums)
        
        XCTAssertFalse(result)
    }
}
