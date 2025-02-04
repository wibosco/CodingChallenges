//
//  SmallestStringWithSwapsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SmallestStringWithSwapsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "dcab"
        let pairs = [[0, 3],
                     [1, 2]]
        
        let result = SmallestStringWithSwaps().smallestStringWithSwaps(s, pairs)
        
        XCTAssertEqual(result, "bacd")
    }
    
    func test_B() {
        let s = "dcab"
        let pairs = [[0, 3],
                     [1, 2],
                     [0, 2]]
        
        let result = SmallestStringWithSwaps().smallestStringWithSwaps(s, pairs)
        
        XCTAssertEqual(result, "abcd")
    }
    
    func test_C() {
        let s = "cba"
        let pairs = [[0, 1],
                     [1, 2]]
        
        let result = SmallestStringWithSwaps().smallestStringWithSwaps(s, pairs)
        
        XCTAssertEqual(result, "abc")
    }
}
