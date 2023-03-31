//
//  LengthOfLastWordTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/03/2022.
//

import XCTest

@testable import LeetCode

final class LengthOfLastWordTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "Hello World"
        
        let length = LengthOfLastWord.lengthOfLastWord(s)
        
        XCTAssertEqual(length, 5)
    }
    
    func test_B() {
        let s = "   fly me   to   the moon  "
        
        let length = LengthOfLastWord.lengthOfLastWord(s)
        
        XCTAssertEqual(length, 4)
    }
    
    func test_C() {
        let s = "luffy is still joyboy"
        
        let length = LengthOfLastWord.lengthOfLastWord(s)
        
        XCTAssertEqual(length, 6)
    }
}
