// Created 04/02/2025.


import XCTest

@testable import LeetCode

final class FindTheLexicographicallySmallestValidSequenceTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let word1 = "vbcca"
        let word2 = "abc"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [0,1,2])
    }
    
    func test_B() {
        let word1 = "bacdc"
        let word2 = "abc"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [1,2,4])
    }
    
    func test_C() {
        let word1 = "aaaaaa"
        let word2 = "aaabc"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [])
    }
    
    func test_D() {
        let word1 = "abc"
        let word2 = "ab"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [0,1])
    }
    
    func test_E() {
        let word1 = "cdbbcdddddbdddbcdbdbbbccbbc"
        let word2 = "dbc"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [0,2,4])
    }
    
    func test_F() {
        let word1 = "gfgggfgfgfffggggggggfgfggfffgffggfffggggfgfggfggggfffg"
        let word2 = "gggffgg"
            
        let result = FindTheLexicographicallySmallestValidSequence().validSequence(word1, word2)
        
        XCTAssertEqual(result, [0,1,2,5,7,8,12])
    }
}
