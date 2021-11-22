//
//  GuessNumberHigherOrLowerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class GuessNumberHigherOrLowerTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 10
        let pick = 6
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let output = sut.guessNumber(n)
        
        XCTAssertEqual(output, pick)
    }
    
    func test_B() {
        let n = 1
        let pick = 1
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let output = sut.guessNumber(n)
        
        XCTAssertEqual(output, pick)
    }
    
    func test_C() {
        let n = 2
        let pick = 1
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let output = sut.guessNumber(n)
        
        XCTAssertEqual(output, pick)
    }
    
    func test_D() {
        let n = 2
        let pick = 2
        
        let sut = GuessNumberHigherOrLower(picked: pick)
        
        let output = sut.guessNumber(n)
        
        XCTAssertEqual(output, pick)
    }
}
