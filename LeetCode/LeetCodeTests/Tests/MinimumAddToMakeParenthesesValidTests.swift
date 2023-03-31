//
//  MinimumAddToMakeParenthesesValidTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MinimumAddToMakeParenthesesValidTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "())"
        
        let min = MinimumAddToMakeParenthesesValid.minAddToMakeValid(s)
        
        XCTAssertEqual(min, 1)
    }
    
    func test_B() {
        let s = "((("
        
        let min = MinimumAddToMakeParenthesesValid.minAddToMakeValid(s)
        
        XCTAssertEqual(min, 3)
    }
    
    func test_C() {
        let s = "()))(("
        
        let min = MinimumAddToMakeParenthesesValid.minAddToMakeValid(s)
        
        XCTAssertEqual(min, 4)
    }
}
