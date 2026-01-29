// Created 11/04/2023.

import XCTest

@testable import LeetCode

final class LongestRepeatingCharacterReplacementTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let s = "ABAB"
        let k = 2
        
        let result = LongestRepeatingCharacterReplacement().characterReplacement(s, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let s = "AABABBA"
        let k = 1
        
        let result = LongestRepeatingCharacterReplacement().characterReplacement(s, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let s = "GGAAAABACCBBA"
        let k = 2
        
        let result = LongestRepeatingCharacterReplacement().characterReplacement(s, k)
        
        XCTAssertEqual(result, 7)
    }
}
