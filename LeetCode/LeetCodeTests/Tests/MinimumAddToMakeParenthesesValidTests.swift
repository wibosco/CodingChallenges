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
        
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let s = "((("
        
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let s = "()))(("
        
        let result = MinimumAddToMakeParenthesesValid().minAddToMakeValid(s)
        
        XCTAssertEqual(result, 4)
    }
}
