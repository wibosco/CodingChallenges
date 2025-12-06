// Created 01/09/2024.


import XCTest

@testable import LeetCode

final class ReverseVowelsOfAStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "hello"
        
        let result = ReverseVowelsOfAString().reverseVowels(s)
        
        XCTAssertEqual(result, "holle")
    }
    
    func test_B() {
        let s = "leetcode"
        
        let result = ReverseVowelsOfAString().reverseVowels(s)
        
        XCTAssertEqual(result, "leotcede")
    }
    
    func test_C() {
        let s = "aA"
        
        let result = ReverseVowelsOfAString().reverseVowels(s)
        
        XCTAssertEqual(result, "Aa")
    }
}
