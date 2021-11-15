//
//  ValidPalindromeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ValidPalindromeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "A man, a plan, a canal: Panama"
        
        let isPalindrome = ValidPalindrome.isPalindrome(s)
        
        XCTAssertTrue(isPalindrome)
    }
    
    func test_B() {
        let s = "race a car"
        
        let isPalindrome = ValidPalindrome.isPalindrome(s)
        
        XCTAssertFalse(isPalindrome)
    }
    
    func test_C() {
        let s = " "
        
        let isPalindrome = ValidPalindrome.isPalindrome(s)
        
        XCTAssertTrue(isPalindrome)
    }
    
    func test_D() {
        let s = "race car"
        
        let isPalindrome = ValidPalindrome.isPalindrome(s)
        
        XCTAssertTrue(isPalindrome)
    }
    
    func test_E() {
        let s = "saas"
        
        let isPalindrome = ValidPalindrome.isPalindrome(s)
        
        XCTAssertTrue(isPalindrome)
    }
}
