//
//  ValidPalindromeIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ValidPalindromeIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "aba"
        
        let isValid = ValidPalindromeII.validPalindrome(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_B() {
        let s = "abca"
        
        let isValid = ValidPalindromeII.validPalindrome(s)
        
        XCTAssertTrue(isValid)
    }
    
    func test_C() {
        let s = "abc"
        
        let isValid = ValidPalindromeII.validPalindrome(s)
        
        XCTAssertFalse(isValid)
    }

}
