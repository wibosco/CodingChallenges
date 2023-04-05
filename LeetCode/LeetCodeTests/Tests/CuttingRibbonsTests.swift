//
//  CuttingRibbonsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CuttingRibbonsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let ribbons = [9, 7, 5]
        let k = 3
        
        let length = CuttingRibbons.maxLength(ribbons, k)
        
        XCTAssertEqual(length, 5)
    }
    
    func test_B() {
        let ribbons = [7, 5, 9]
        let k = 4
        
        let length = CuttingRibbons.maxLength(ribbons, k)
        
        XCTAssertEqual(length, 4)
    }
    
    func test_C() {
        let ribbons = [5, 7, 9]
        let k = 22
        
        let length = CuttingRibbons.maxLength(ribbons, k)
        
        XCTAssertEqual(length, 0)
    }
    
    func test_D() {
        let ribbons = [100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       1,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000]
        let k = 49
        
        let length = CuttingRibbons.maxLength(ribbons, k)
        
        XCTAssertEqual(length, 100000)
    }
}
