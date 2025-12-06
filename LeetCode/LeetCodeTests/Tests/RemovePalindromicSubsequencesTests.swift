// Created 05/06/2024.


import XCTest

@testable import LeetCode

final class RemovePalindromicSubsequencesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "ababa"
        
        let result = RemovePalindromicSubsequences().removePalindromeSub(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let s = "abb"
        
        let result = RemovePalindromicSubsequences().removePalindromeSub(s)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let s = "baabb"
        
        let result = RemovePalindromicSubsequences().removePalindromeSub(s)
        
        XCTAssertEqual(result, 2)
    }
}
