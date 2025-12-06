// Created 11/06/2024.


import XCTest

@testable import LeetCode

final class CheckIfAWordOccursAsAPrefixOfAnyWordInASentenceTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let sentence = "i love eating burger"
        let searchWord = "burg"
        
        let result = CheckIfAWordOccursAsAPrefixOfAnyWordInASentence().isPrefixOfWord(sentence, searchWord)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let sentence = "this problem is an easy problem"
        let searchWord = "pro"
        
        let result = CheckIfAWordOccursAsAPrefixOfAnyWordInASentence().isPrefixOfWord(sentence, searchWord)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let sentence = "i am tired"
        let searchWord = "you"
        
        let result = CheckIfAWordOccursAsAPrefixOfAnyWordInASentence().isPrefixOfWord(sentence, searchWord)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let sentence = "hellohello hellohellohello"
        let searchWord = "ell"
        
        let result = CheckIfAWordOccursAsAPrefixOfAnyWordInASentence().isPrefixOfWord(sentence, searchWord)
        
        XCTAssertEqual(result, -1)
    }
}
