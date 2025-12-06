// Created 24/12/2021.


import XCTest

@testable import LeetCode

final class VerifyingAnAlienDictionaryTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let words = ["hello",
                     "leetcode"]
        let order = "hlabcdefgijkmnopqrstuvwxyz"
        
        let result = VerifyingAnAlienDictionary().isAlienSorted(words, order)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let words = ["word",
                     "world",
                     "row"]
        let order = "worldabcefghijkmnpqstuvxyz"
        
        let result = VerifyingAnAlienDictionary().isAlienSorted(words, order)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let words = ["apple",
                     "app"]
        let order = "abcdefghijklmnopqrstuvwxyz"
        
        let result = VerifyingAnAlienDictionary().isAlienSorted(words, order)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let words = ["kuvp",
                     "q"]
        let order = "ngxlkthsjuoqcpavbfdermiywz"
        
        let result = VerifyingAnAlienDictionary().isAlienSorted(words, order)
        
        XCTAssertTrue(result)
    }
}
