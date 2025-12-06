// Created 23/12/2021.


import XCTest

@testable import LeetCode

final class ValidPalindromeIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "aba"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "abca"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "abc"
        
        let result = ValidPalindromeII().validPalindrome(s)
        
        XCTAssertFalse(result)
    }

}
