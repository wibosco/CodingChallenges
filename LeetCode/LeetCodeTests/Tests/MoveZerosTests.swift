//
//  MoveZerosTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MoveZerosTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums = [0, 1, 0, 3, 12]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [1, 3, 12, 0, 0])
    }
    
    func test_B() {
        var nums = [0]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [0])
    }
    
    func test_C() {
        var nums = [0, 1]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [1, 0])
    }
    
    func test_D() {
        var nums = [2, 1]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [2, 1])
    }
    
    func test_E() {
        var nums = [0, 0]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [0, 0])
    }
    
    func test_F() {
        var nums = [4, 2, 4, 0, 0, 3, 0, 5, 1, 0]
        
        MoveZeros.moveZeroes(&nums)
        
        XCTAssertEqual(nums, [4, 2, 4, 3, 5, 1, 0, 0, 0, 0])
    }
}
