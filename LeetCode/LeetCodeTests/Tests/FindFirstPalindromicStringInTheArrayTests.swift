// Created 06/03/2024.


import XCTest

@testable import LeetCode

final class FindFirstPalindromicStringInTheArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let words = ["abc","car","ada","racecar","cool"]
        
        let result = FindFirstPalindromicStringInTheArray().firstPalindrome(words)
        
        XCTAssertEqual(result, "ada")
    }
    
    func test_B() {
        let words = ["notapalindrome","racecar"]
        
        let result = FindFirstPalindromicStringInTheArray().firstPalindrome(words)
        
        XCTAssertEqual(result, "racecar")
    }
    
    func test_C() {
        let words = ["def","ghi"]
        
        let result = FindFirstPalindromicStringInTheArray().firstPalindrome(words)
        
        XCTAssertEqual(result, "")
    }
}
