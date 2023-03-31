//
//  ContiguousArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/02/2022.
//

import XCTest

@testable import LeetCode

final class ContiguousArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [0, 1]
        
        let length = ContiguousArray.findMaxLength(nums)
        
        XCTAssertEqual(length, 2)
    }
    
    func test_B() {
        let nums = [0, 1, 0]
        
        let length = ContiguousArray.findMaxLength(nums)
        
        XCTAssertEqual(length, 2)
    }
    
    func test_C() {
        let nums = [0, 1, 0, 1]
        
        let length = ContiguousArray.findMaxLength(nums)
        
        XCTAssertEqual(length, 4)
    }
    
    func test_D() {
        let nums = [0, 0, 1, 0, 0, 0, 1, 1]
        
        let length = ContiguousArray.findMaxLength(nums)
        
        XCTAssertEqual(length, 6)
    }
}
