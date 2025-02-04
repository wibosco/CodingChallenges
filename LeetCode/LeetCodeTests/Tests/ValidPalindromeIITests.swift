//
//  ValidPalindromeIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ValidPalindromeIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "aba"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "abca"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "abc"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertFalse(result)
    }

}
