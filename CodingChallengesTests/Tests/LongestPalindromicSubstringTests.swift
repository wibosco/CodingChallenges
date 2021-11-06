//
//  LongestPalindromicSubstringTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 04/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class LongestPalindromicSubstringTests: XCTestCase {

    // MARK: - Tests

    func test_longestA() {
        let s = "babad"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "bab")
    }
    
    func test_longestB() {
        let s = "cbbd"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "bb")
    }
    
    func test_longestC() {
        let s = "a"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "a")
    }
    
    func test_longestD() {
        let s = "ac"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "a")
    }
    
    func test_longestE() {
        let s = "jglknendplocymmvwtoxvebkekzfdhykknufqdkntnqvgfbahsljkobhbxkvyictzkqjqydczuxjkgecdyhixdttxfqmgksrkyvopwprsgoszftuhawflzjyuyrujrxluhzjvbflxgcovilthvuihzttzithnsqbdxtafxrfrblulsakrahulwthhbjcslceewxfxtavljpimaqqlcbrdgtgjryjytgxljxtravwdlnrrauxplempnbfeusgtqzjtzshwieutxdytlrrqvyemlyzolhbkzhyfyttevqnfvmpqjngcnazmaagwihxrhmcibyfkccyrqwnzlzqeuenhwlzhbxqxerfifzncimwqsfatudjihtumrtjtggzleovihifxufvwqeimbxvzlxwcsknksogsbwwdlwulnetdysvsfkonggeedtshxqkgbhoscjgpiel"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "sknks")
    }
    
    func test_longestF() {
        let s = "abeba"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "abeba")
    }
    
    func test_longestG() {
        let s = "racecar"
        
        let longest = LongestPalindromicSubstring.longestPalindrome(s)
        
        XCTAssertEqual(longest, "racecar")
    }
}
