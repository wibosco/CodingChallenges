//
//  ReverseStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ReverseStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var s = ["h", "e", "l", "l", "o"]
        
        ReverseString.reverseString(&s)
        
        XCTAssertEqual(s, ["o", "l", "l", "e", "h"])
    }
    
    func test_B() {
        var s = ["H", "a", "n", "n", "a", "h"]
        
        ReverseString.reverseString(&s)
        
        XCTAssertEqual(s, ["h", "a", "n", "n", "a", "H"])
    }
}
