//
//  FindAllAnagramsInAStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/02/2022.
//

import XCTest

@testable import LeetCode

class FindAllAnagramsInAStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "cbaebabacd"
        let p = "abc"
        
        let indexes = FindAllAnagramsInAString.findAnagrams(s, p)
        
        XCTAssertEqual(indexes, [0, 6])
    }
    
    func test_B() {
        let s = "abab"
        let p = "ab"
        
        let indexes = FindAllAnagramsInAString.findAnagrams(s, p)
        
        XCTAssertEqual(indexes, [0, 1, 2])
    }
    
    func test_C() {
        let s = "aaaaaaaaaa"
        let p = "aaaaaaaaaaaaa"
        
        let indexes = FindAllAnagramsInAString.findAnagrams(s, p)
        
        XCTAssertEqual(indexes, [Int]())
    }
}
