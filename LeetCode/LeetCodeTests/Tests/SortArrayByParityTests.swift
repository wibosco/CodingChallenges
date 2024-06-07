//
//  SortArrayByParityTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/06/2024.
//

import XCTest

@testable import LeetCode

final class SortArrayByParityTests: XCTestCase {


    // MARK: - Tests
    
    func test_A() {
        let nums = [3,1,2,4]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        XCTAssertEqual(result, [2,4,3,1])
    }
    
    func test_B() {
        let nums = [0]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        XCTAssertEqual(result, [0])
    }
    
    func test_C() {
        let nums = [1,2,3,4]
        
        let result = SortArrayByParity().sortArrayByParity(nums)
        
        XCTAssertEqual(result, [2,4,3,1])
    }
}
