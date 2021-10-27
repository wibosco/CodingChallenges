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
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_isPalindromeTrue() {
        
        let string = "toaoT"
        
        let isPalindrome = Palindrome.isPalindrome(string: string)
        
        XCTAssertTrue(isPalindrome, "Should be true")
    }
    
    func test_isPalindromeFalse() {
        
        let string = "bananana"
        
        let isPalindrome = Palindrome.isPalindrome(string: string)
        
        XCTAssertFalse(isPalindrome, "Should be false")
    }
    
}
