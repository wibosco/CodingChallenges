//
//  NumberOfArithmeticTripletsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/03/2024.
//

import XCTest

@testable import LeetCode

final class NumberOfArithmeticTripletsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [0,1,4,6,7,10]
        let diff = 3
        
        let result = NumberOfArithmeticTriplets().arithmeticTriplets(nums, diff)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [4,5,6,7,8,9]
        let diff = 2
        
        let result = NumberOfArithmeticTriplets().arithmeticTriplets(nums, diff)
        
        XCTAssertEqual(result, 2)
    }
}
