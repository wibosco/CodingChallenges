//
//  FindSmallestLetterGreaterThanTargetTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindSmallestLetterGreaterThanTargetTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "a"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "c")
    }
    
    func test_B() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "c"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "f")
    }
    
    func test_C() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "d"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "f")
    }
    
    func test_D() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "g"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "j")
    }
    
    func test_E() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "j"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "c")
    }
    
    func test_F() {
        let letters: [Character] = ["c", "f", "j"]
        let target: Character = "z"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "c")
    }
    
    func test_G() {
        let letters: [Character] = ["e", "e", "e", "e", "e", "e", "n", "n", "n", "n"]
        let target: Character = "n"
        
        let result = FindSmallestLetterGreaterThanTarget.nextGreatestLetter(letters, target)
        
        XCTAssertEqual(result, "e")
    }
}
