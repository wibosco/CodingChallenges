//
//  FindSmallestLetterGreaterThanTargetTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class FindSmallestLetterGreaterThanTargetTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "a"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "c")
    }
    
    func test_B() {
        let letters: [Character] = ["c","f","j"]
        let target: Character = "c"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "f")
    }
    
    func test_C() {
        let letters: [Character] = ["c","f","j"]
        let target: Character = "d"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "f")
    }
    
    func test_D() {
        let letters: [Character] = ["c","f","j"]
        let target: Character = "g"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "j")
    }
    
    func test_E() {
        let letters: [Character] = ["c","f","j"]
        let target: Character = "j"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "c")
    }
    
    func test_F() {
        let letters: [Character] = ["c","f","j"]
        let target: Character = "z"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "c")
    }
    
    func test_G() {
        let letters: [Character] = ["e", "e", "e", "e", "e", "e", "n", "n", "n", "n"]
        let target: Character = "n"
        
        let next = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(next, "e")
    }
}
