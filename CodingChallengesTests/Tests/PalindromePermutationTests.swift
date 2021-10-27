//
//  PalindromePermutationTests.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class PalindromePermutationTests: XCTestCase {
    
    // MARK: Tests
    
    func test_palindromePermutationA() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "ab"))
    }
    
    func test_palindromePermutationB() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "annaa"))
    }
    
    func test_palindromePermutationC() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "abc"))
    }
    
    func test_palindromePermutationD() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "tact coa"))
    }
    
    func test_palindromePermutationE() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "annaat"))
    }
    
    func test_palindromePermutationF() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "bb"))
    }
    
}
