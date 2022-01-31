//
//  VerifyingAnAlienDictionaryTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 24/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class VerifyingAnAlienDictionaryTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let words = ["hello",
                     "leetcode"]
        let order = "hlabcdefgijkmnopqrstuvwxyz"
        
        let isSorted = VerifyingAnAlienDictionary.isAlienSorted(words, order)
        
        XCTAssertTrue(isSorted)
    }
    
    func test_B() {
        let words = ["word",
                     "world",
                     "row"]
        let order = "worldabcefghijkmnpqstuvxyz"
        
        let isSorted = VerifyingAnAlienDictionary.isAlienSorted(words, order)
        
        XCTAssertFalse(isSorted)
    }
    
    func test_C() {
        let words = ["apple",
                     "app"]
        let order = "abcdefghijklmnopqrstuvwxyz"
        
        let isSorted = VerifyingAnAlienDictionary.isAlienSorted(words, order)
        
        XCTAssertFalse(isSorted)
    }
    
    func test_D() {
        let words = ["kuvp",
                     "q"]
        let order = "ngxlkthsjuoqcpavbfdermiywz"

        
        let isSorted = VerifyingAnAlienDictionary.isAlienSorted(words, order)
        
        XCTAssertTrue(isSorted)
    }
}
