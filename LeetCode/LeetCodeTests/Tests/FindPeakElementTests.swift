//
//  FindPeakElementTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindPeakElementTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 1]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_B() {
        let nums = [1, 2, 1, 3, 5, 6, 4]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 5) // other peak is at 1
    }
    
    func test_C() {
        let nums = [1]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_D() {
        let nums = [1, 2]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_E() {
        let nums = [1, 2, 3]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_F() {
        let nums = [6, 5, 4, 3, 2, 3, 2]
        
        let index = FindPeakElement.findPeakElement(nums)
        
        XCTAssertEqual(index, 0)
    }
}
