//
//  MinimumNumberOfSwapsToMakeTheStringBalancedTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MinimumNumberOfSwapsToMakeTheStringBalancedTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "][]["
        
        let minimum = MinimumNumberOfSwapsToMakeTheStringBalanced.minSwaps(s)
        
        XCTAssertEqual(minimum, 1)
    }
    
    func test_B() {
        let s = "]]][[["
        
        let minimum = MinimumNumberOfSwapsToMakeTheStringBalanced.minSwaps(s)
        
        XCTAssertEqual(minimum, 2)
    }
    
    func test_C() {
        let s = "[]"
        
        let minimum = MinimumNumberOfSwapsToMakeTheStringBalanced.minSwaps(s)
        
        XCTAssertEqual(minimum, 0)
    }
}
