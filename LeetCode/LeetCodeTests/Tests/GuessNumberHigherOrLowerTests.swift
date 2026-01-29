// Created 17/11/2021.

import XCTest

@testable import LeetCode

final class GuessNumberHigherOrLowerTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 10
        let pick = 6
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let result = sut.guessNumber(n)
        
        XCTAssertEqual(result, pick)
    }
    
    func test_B() {
        let n = 1
        let pick = 1
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let result = sut.guessNumber(n)
        
        XCTAssertEqual(result, pick)
    }
    
    func test_C() {
        let n = 2
        let pick = 1
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let result = sut.guessNumber(n)
        
        XCTAssertEqual(result, pick)
    }
    
    func test_D() {
        let n = 2
        let pick = 2
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let result = sut.guessNumber(n)
        
        XCTAssertEqual(result, pick)
    }
}
