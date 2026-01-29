// Created 04/11/2021.

import XCTest

@testable import LeetCode

final class LongestPalindromicSubstringTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let s = "babad"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "bab")
    }
    
    func test_B() {
        let s = "cbbd"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "bb")
    }
    
    func test_C() {
        let s = "a"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_D() {
        let s = "ac"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_E() {
        let s = "jglknendplocymmvwtoxvebkekzfdhykknufqdkntnqvgfbahsljkobhbxkvyictzkqjqydczuxjkgecdyhixdttxfqmgksrkyvopwprsgoszftuhawflzjyuyrujrxluhzjvbflxgcovilthvuihzttzithnsqbdxtafxrfrblulsakrahulwthhbjcslceewxfxtavljpimaqqlcbrdgtgjryjytgxljxtravwdlnrrauxplempnbfeusgtqzjtzshwieutxdytlrrqvyemlyzolhbkzhyfyttevqnfvmpqjngcnazmaagwihxrhmcibyfkccyrqwnzlzqeuenhwlzhbxqxerfifzncimwqsfatudjihtumrtjtggzleovihifxufvwqeimbxvzlxwcsknksogsbwwdlwulnetdysvsfkonggeedtshxqkgbhoscjgpiel"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "sknks")
    }
    
    func test_F() {
        let s = "abeba"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "abeba")
    }
    
    func test_G() {
        let s = "racecar"
        
        let result = LongestPalindromicSubstring().longestPalindrome(s)
        
        XCTAssertEqual(result, "racecar")
    }
}
