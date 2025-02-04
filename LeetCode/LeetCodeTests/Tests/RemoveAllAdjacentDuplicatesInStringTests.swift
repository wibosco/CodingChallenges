//
//  RemoveAllAdjacentDuplicatesInStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class RemoveAllAdjacentDuplicatesInStringTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "abbaca"
        
        let result = RemoveAllAdjacentDuplicatesInString().removeDuplicates(s)
        
        XCTAssertEqual(result, "ca")
    }
    
    func test_B() {
        let s = "azxxzy"
        
        let result = RemoveAllAdjacentDuplicatesInString().removeDuplicates(s)
        
        XCTAssertEqual(result, "ay")
    }
    
    func test_C() {
        let s = "aabc"
        
        let result = RemoveAllAdjacentDuplicatesInString().removeDuplicates(s)
        
        XCTAssertEqual(result, "bc")
    }
    
    func test_D() {
        let s = "bcaa"
        
        let result = RemoveAllAdjacentDuplicatesInString().removeDuplicates(s)
        
        XCTAssertEqual(result, "bc")
    }
}
