//
//  FindTheIndexOfTheFirstOccurrenceInAString.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/07/2023.
//

import XCTest

@testable import LeetCode

final class FindTheIndexOfTheFirstOccurrenceInAStringTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let haystack = "hello"
        let needle = "he"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_B() {
        let haystack = "hello"
        let needle = "el"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let haystack = "leetcode"
        let needle = "leeto"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let haystack = "a"
        let needle = "a"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_E() {
        let haystack = "a"
        let needle = "b"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_F() {
        let haystack = "bb"
        let needle = "bbb"
        
        let result = FindTheIndexOfTheFirstOccurrenceInAString.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
}
