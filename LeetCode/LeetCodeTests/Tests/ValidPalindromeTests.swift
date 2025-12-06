// Created 15/11/2021.


import XCTest

@testable import LeetCode

final class ValidPalindromeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "A man, a plan, a canal: Panama"
        
        let result = ValidPalindrome().isPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "race a car"
        
        let result = ValidPalindrome().isPalindrome(s)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = " "
        
        let result = ValidPalindrome().isPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let s = "race car"
        
        let result = ValidPalindrome().isPalindrome(s)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let s = "saas"
        
        let result = ValidPalindrome().isPalindrome(s)
        
        XCTAssertTrue(result)
    }
}
