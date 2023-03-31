//
//  PalindromeNumberTests.swift
//  CodingChallengesTests
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
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(isPalindrome)
    }
    
    func test_B() {
        let x = -121
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_C() {
        let x = 10
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_D() {
        let x = -101
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_E() {
        let x = 1234
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_F() {
        let x = 0
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(isPalindrome)
    }
    
    func test_G() {
        let x = 20
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_H() {
        let x = 12021
        
        let isPalindrome = PalindromeNumber.isPalindrome(x)
        
        XCTAssertTrue(isPalindrome)
    }
}
