//
//  PalindromePermutationTests.swift
//  CrackingTheCodingInterviewTests
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

final class PalindromePermutationTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "ab"))
    }
    
    func test_B() {
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "annaa"))
    }
    
    func test_C() {
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "abc"))
    }
    
    func test_D() {
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "tact coa"))
    }
    
    func test_E() {
        XCTAssertFalse(PalindromePermutation.premutationCanBePalindrome(original: "annaat"))
    }
    
    func test_F() {
        XCTAssertTrue(PalindromePermutation.premutationCanBePalindrome(original: "bb"))
    }
    
}
