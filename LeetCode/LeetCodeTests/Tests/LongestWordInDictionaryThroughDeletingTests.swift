//
//  LongestWordInDictionaryThroughDeletingTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/09/2024.
//

import XCTest

@testable import LeetCode

final class LongestWordInDictionaryThroughDeletingTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "abpcplea"
        let dictionary = ["ale","apple","monkey","plea"]
        
        let result = LongestWordInDictionaryThroughDeleting().findLongestWord(s, dictionary)
        
        XCTAssertEqual(result, "apple")
    }
    
    func test_B() {
        let s = "abpcplea"
        let dictionary = ["a","b","c"]
        
        let result = LongestWordInDictionaryThroughDeleting().findLongestWord(s, dictionary)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_C() {
        let s = "abpcplea"
        let dictionary = ["b","c","a"]
        
        let result = LongestWordInDictionaryThroughDeleting().findLongestWord(s, dictionary)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_D() {
        let s = "abpcplea"
        let dictionary = ["ale","apple","monkey","plea", "abpcplaaa","abpcllllll","abccclllpppeeaaaa"]
        
        let result = LongestWordInDictionaryThroughDeleting().findLongestWord(s, dictionary)
        
        XCTAssertEqual(result, "apple")
    }
}
