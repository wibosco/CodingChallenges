//
//  SingleNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/03/2023.
//

import XCTest

@testable import LeetCode

final class SingleNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 2, 1]
        
        let single = SingleNumber.singleNumber(nums)
        
        XCTAssertEqual(single, 1)
    }
    
    func test_B() {
        let nums = [4, 1, 2, 1, 2]
        
        let single = SingleNumber.singleNumber(nums)
        
        XCTAssertEqual(single, 4)
    }
    
    func test_C() {
        let nums = [1]
        
        let single = SingleNumber.singleNumber(nums)
        
        XCTAssertEqual(single, 1)
    }
    
    func test_D() {
        let nums = [2, 1, -2, 1, -2]
        
        let single = SingleNumber.singleNumber(nums)
        
        XCTAssertEqual(single, 2)
    }
}
