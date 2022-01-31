//
//  UglyNumberTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class UglyNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 6
        
        let isUgly = UglyNumber.isUgly(n)
        
        XCTAssertTrue(isUgly)
    }
    
    func test_B() {
        let n = 1
        
        let isUgly = UglyNumber.isUgly(n)
        
        XCTAssertTrue(isUgly)
    }
    
    func test_C() {
        let n = 14
        
        let isUgly = UglyNumber.isUgly(n)
        
        XCTAssertFalse(isUgly)
    }
}
