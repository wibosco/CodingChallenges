//
//  PalindromicSubstringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/04/2023.
//

import XCTest

@testable import LeetCode

final class PalindromicSubstringsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "abc"
        
        let result = PalindromicSubstrings().countSubstrings(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let s = "aaa"
        
        let result = PalindromicSubstrings().countSubstrings(s)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_C() {
        let s = "aba"
        
        let result = PalindromicSubstrings().countSubstrings(s)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let s = "abba"
        
        let result = PalindromicSubstrings().countSubstrings(s)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_E() {
        let s = "fdsklf"
        
        let result = PalindromicSubstrings().countSubstrings(s)
        
        XCTAssertEqual(result, 6)
    }
}
