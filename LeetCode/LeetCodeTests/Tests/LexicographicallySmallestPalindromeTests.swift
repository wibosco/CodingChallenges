// Created 05/06/2024.

import XCTest

@testable import LeetCode

final class LexicographicallySmallestPalindromeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "egcfe"
        
        let result = LexicographicallySmallestPalindrome().makeSmallestPalindrome(s)
        
        XCTAssertEqual(result, "efcfe")
    }
    
    func test_B() {
        let s = "abcd"
        
        let result = LexicographicallySmallestPalindrome().makeSmallestPalindrome(s)
        
        XCTAssertEqual(result, "abba")
    }
    
    func test_C() {
        let s = "seven"
        
        let result = LexicographicallySmallestPalindrome().makeSmallestPalindrome(s)
        
        XCTAssertEqual(result, "neven")
    }
}
