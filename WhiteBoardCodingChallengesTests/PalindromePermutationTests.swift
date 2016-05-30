//
//  PalindromePermutationTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class PalindromePermutationTests: XCTestCase {
    
    // MARK: Tests
    
    func test_palindromePermutationA() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome("ab"))
    }
    
    func test_palindromePermutationB() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome("annaa"))
    }
    
    func test_palindromePermutationC() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome("abc"))
    }
    
    func test_palindromePermutationD() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome("tact coa"))
    }
    
    func test_palindromePermutationE() {
        
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome("annaat"))
    }
    
    func test_palindromePermutationF() {
        
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome("bb"))
    }
    
}
