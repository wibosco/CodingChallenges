// Created 10/06/2024.

import XCTest

@testable import LeetCode

final class ShortestDistanceToACharacterTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "loveleetcode"
        let c: Character = "e"
            
        let result = ShortestDistanceToACharacter().shortestToChar(s, c)
        
        XCTAssertEqual(result, [3,2,1,0,1,0,0,1,2,2,1,0])
    }
    
    func test_B() {
        let s = "aaab"
        let c: Character = "b"
            
        let result = ShortestDistanceToACharacter().shortestToChar(s, c)
        
        XCTAssertEqual(result, [3,2,1,0])
    }
}
