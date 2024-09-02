//
//  ReverseStringIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/09/2024.
//

import XCTest

@testable import LeetCode

final class ReverseStringIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "abcdefg"
        let k = 2
            
        let result = ReverseStringII().reverseStr(s, k)
        
        XCTAssertEqual(result, "bacdfeg")
    }
    
    func test_B() {
        let s = "abcd"
        let k = 2
            
        let result = ReverseStringII().reverseStr(s, k)
        
        XCTAssertEqual(result, "bacd")
    }
    
    func test_C() {
        let s = "a"
        let k = 2
            
        let result = ReverseStringII().reverseStr(s, k)
        
        XCTAssertEqual(result, "a")
    }
}
