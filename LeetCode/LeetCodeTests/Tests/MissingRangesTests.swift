// Created 10/04/2022.

import XCTest

@testable import LeetCode

final class MissingRangesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [0, 1, 3, 50, 75]
        let lower = 0
        let upper = 99
        
        let result = MissingRanges().findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(result, ["2", "4->49", "51->74", "76->99"])
    }
    
    func test_B() {
        let nums = [-1]
        let lower = -1
        let upper = -1
        
        let result = MissingRanges().findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(result, [])
    }
    
    func test_C() {
        let nums = [-1]
        let lower = -1
        let upper = 0
        
        let result = MissingRanges().findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(result, ["0"])
    }
    
    func test_D() {
        let nums = [Int]()
        let lower = 1
        let upper = 1
        
        let result = MissingRanges().findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(result, ["1"])
    }
    
    func test_E() {
        let nums = [-1]
        let lower = -2
        let upper = -1
        
        let result = MissingRanges().findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(result, ["-2"])
    }
}
