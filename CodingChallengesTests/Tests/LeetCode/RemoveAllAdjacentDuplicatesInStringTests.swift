//
//  RemoveAllAdjacentDuplicatesInStringTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 27/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class RemoveAllAdjacentDuplicatesInStringTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "abbaca"
        
        let removed = RemoveAllAdjacentDuplicatesInString.removeDuplicates(s)
        
        XCTAssertEqual(removed, "ca")
    }
    
    func test_B() {
        let s = "azxxzy"
        
        let removed = RemoveAllAdjacentDuplicatesInString.removeDuplicates(s)
        
        XCTAssertEqual(removed, "ay")
    }
    
    func test_C() {
        let s = "aabc"
        
        let removed = RemoveAllAdjacentDuplicatesInString.removeDuplicates(s)
        
        XCTAssertEqual(removed, "bc")
    }
    
    func test_D() {
        let s = "bcaa"
        
        let removed = RemoveAllAdjacentDuplicatesInString.removeDuplicates(s)
        
        XCTAssertEqual(removed, "bc")
    }
    
}
