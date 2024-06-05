//
//  AAReversePrefixOfWordTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/06/2024.
//

import XCTest

@testable import LeetCode

final class ReversePrefixOfWordTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let word = "abcdefd"
        let ch: Character = "d"
            
        let result = ReversePrefixOfWord().reversePrefix(word, ch)
        
        XCTAssertEqual(result, "dcbaefd")
    }
    
    func test_B() {
        let word = "xyxzxe"
        let ch: Character = "z"
            
        let result = ReversePrefixOfWord().reversePrefix(word, ch)
        
        XCTAssertEqual(result, "zxyxxe")
    }
    
    func test_C() {
        let word = "abcd"
        let ch: Character = "z"
            
        let result = ReversePrefixOfWord().reversePrefix(word, ch)
        
        XCTAssertEqual(result, "abcd")
    }
}
