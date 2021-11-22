//
//  PalindromeTests.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class PalindromeTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        
        let string = "toaoT"
        
        let isPalindrome = Palindrome.isPalindrome(string: string)
        
        XCTAssertTrue(isPalindrome, "Should be true")
    }
    
    func test_B() {
        
        let string = "bananana"
        
        let isPalindrome = Palindrome.isPalindrome(string: string)
        
        XCTAssertFalse(isPalindrome, "Should be false")
    }
    
}
