//
//  SumOfAllOddLengthSubarraysTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/02/2022.
//

import XCTest

@testable import LeetCode

class SumOfAllOddLengthSubarraysTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let arr = [1, 4, 2, 5, 3]
        
        let sum = SumOfAllOddLengthSubarrays.sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(sum, 58)
    }
    
    func test_B() {
        let arr = [1, 2]
        
        let sum = SumOfAllOddLengthSubarrays.sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(sum, 3)
    }
    
    func test_C() {
        let arr = [10, 11, 12]
        
        let sum = SumOfAllOddLengthSubarrays.sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(sum, 66)
    }
}
