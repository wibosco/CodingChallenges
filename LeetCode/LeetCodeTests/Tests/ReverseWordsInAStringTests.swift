// Created 03/09/2024.

import XCTest

@testable import LeetCode

final class ReverseWordsInAStringTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "the sky is blue"
        
        let result = ReverseWordsInAString().reverseWords(s)
        
        XCTAssertEqual(result, "blue is sky the")
    }
    
    func test_B() {
        let s = "  hello world  "
        
        let result = ReverseWordsInAString().reverseWords(s)
        
        XCTAssertEqual(result, "world hello")
    }
    
    func test_C() {
        let s = "a good   example"
        
        let result = ReverseWordsInAString().reverseWords(s)
        
        XCTAssertEqual(result, "example good a")
    }
}
