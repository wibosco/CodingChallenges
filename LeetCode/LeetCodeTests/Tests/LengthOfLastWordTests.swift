// Created 14/03/2022.

import XCTest

@testable import LeetCode

final class LengthOfLastWordTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "Hello World"
        
        let result = LengthOfLastWord().lengthOfLastWord(s)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let s = "   fly me   to   the moon  "
        
        let result = LengthOfLastWord().lengthOfLastWord(s)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let s = "luffy is still joyboy"
        
        let result = LengthOfLastWord().lengthOfLastWord(s)
        
        XCTAssertEqual(result, 6)
    }
}
