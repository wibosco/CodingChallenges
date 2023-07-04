//
//  PalindromeNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PalindromeNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let x = 121
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let x = -121
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let x = 10
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let x = -101
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let x = 1234
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
    
    func test_F() {
        let x = 0
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(result)
    }
    
    func test_G() {
        let x = 20
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(result)
    }
    
    func test_H() {
        let x = 12021
        
        let result = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(result)
    }
}
