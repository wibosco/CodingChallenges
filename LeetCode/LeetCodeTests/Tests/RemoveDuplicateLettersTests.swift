//
//  RemoveDuplicateLettersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/04/2023.
//

import XCTest

@testable import LeetCode

final class RemoveDuplicateLettersTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "bcabc"
        
        let result = RemoveDuplicateLetters.removeDuplicateLetters(s)
        
        XCTAssertEqual(result, "abc")
    }
    
    func test_B() {
        let s = "cbacdcbc"
        
        let result = RemoveDuplicateLetters.removeDuplicateLetters(s)
        
        XCTAssertEqual(result, "acdb")
    }
    
    func test_C() {
        let s = "dedabc"
        
        let result = RemoveDuplicateLetters.removeDuplicateLetters(s)
        
        XCTAssertEqual(result, "deabc")
    }
}
