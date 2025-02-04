//
//  LargestNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/07/2023.
//

import XCTest

@testable import LeetCode

final class LargestNumberTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [10, 2]
        
        let result = LargestNumber().largestNumber(nums)
        
        XCTAssertEqual(result, "210")
    }
    
    func test_B() {
        let nums = [3, 30, 34, 5, 9]
        
        let result = LargestNumber().largestNumber(nums)
        
        XCTAssertEqual(result, "9534330")
    }
    
    func test_C() {
        let nums = [8308, 8308, 830]
        
        let result = LargestNumber().largestNumber(nums)
        XCTAssertEqual(result, "83088308830")
    }
    
    func test_D() {
        let nums = [0, 0]
        
        let result = LargestNumber().largestNumber(nums)
        XCTAssertEqual(result, "0")
    }
}
