//
//  HappyNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class HappyNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 19
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 2
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 1
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertTrue(result)
    }
}
