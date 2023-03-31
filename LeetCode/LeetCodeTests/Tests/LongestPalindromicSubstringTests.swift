//
//  LongestPalindromicSubstringTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LongestPalindromicSubstringTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let s = "babad"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "bab")
    }
    
    func test_B() {
        let s = "cbbd"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "bb")
    }
    
    func test_C() {
        let s = "a"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "a")
    }
    
    func test_D() {
        let s = "ac"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "a")
    }
    
    func test_E() {
        let s = "jglknendplocymmvwtoxvebkekzfdhykknufqdkntnqvgfbahsljkobhbxkvyictzkqjqydczuxjkgecdyhixdttxfqmgksrkyvopwprsgoszftuhawflzjyuyrujrxluhzjvbflxgcovilthvuihzttzithnsqbdxtafxrfrblulsakrahulwthhbjcslceewxfxtavljpimaqqlcbrdgtgjryjytgxljxtravwdlnrrauxplempnbfeusgtqzjtzshwieutxdytlrrqvyemlyzolhbkzhyfyttevqnfvmpqjngcnazmaagwihxrhmcibyfkccyrqwnzlzqeuenhwlzhbxqxerfifzncimwqsfatudjihtumrtjtggzleovihifxufvwqeimbxvzlxwcsknksogsbwwdlwulnetdysvsfkonggeedtshxqkgbhoscjgpiel"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "sknks")
    }
    
    func test_F() {
        let s = "abeba"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "abeba")
    }
    
    func test_G() {
        let s = "racecar"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "racecar")
    }
}
