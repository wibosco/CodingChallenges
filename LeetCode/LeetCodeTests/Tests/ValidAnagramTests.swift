// Created 10/04/2023.

import XCTest

@testable import LeetCode

final class ValidAnagramTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "anagram"
        let t = "nagaram"
        
        let result = ValidAnagram().isAnagram(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "rat"
        let t = "car"
        
        let result = ValidAnagram().isAnagram(s, t)
        
        XCTAssertFalse(result)
    }
}
