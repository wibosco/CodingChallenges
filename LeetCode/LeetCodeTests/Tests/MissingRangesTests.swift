//
//  MissingRangesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/04/2022.
//

import XCTest

@testable import LeetCode

class MissingRangesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [0, 1, 3, 50, 75]
        let lower = 0
        let upper = 99
        
        let missing = MissingRanges.findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(missing, ["2", "4->49", "51->74", "76->99"])
    }
    
    func test_B() {
        let nums = [-1]
        let lower = -1
        let upper = -1
        
        let missing = MissingRanges.findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(missing, [])
    }
    
    func test_C() {
        let nums = [-1]
        let lower = -1
        let upper = 0
        
        let missing = MissingRanges.findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(missing, ["0"])
    }
    
    func test_D() {
        let nums = [Int]()
        let lower = 1
        let upper = 1
        
        let missing = MissingRanges.findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(missing, ["1"])
    }
    
    func test_E() {
        let nums = [-1]
        let lower = -2
        let upper = -1
        
        let missing = MissingRanges.findMissingRanges(nums, lower, upper)
        
        XCTAssertEqual(missing, ["-2"])
    }
}
