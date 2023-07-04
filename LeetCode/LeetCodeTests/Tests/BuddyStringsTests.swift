//
//  BuddyStringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/04/2022.
//

import XCTest

@testable import LeetCode

final class BuddyStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "ab"
        let goal = "ba"
        
        let result = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "ab"
        let goal = "ab"
        
        let result = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = "aa"
        let goal = "aa"
        
        let result = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let s = "aabdd"
        let goal = "aabcc"
        
        let result = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let s = "aabcc"
        let goal = "aabc"
        
        let result = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(result)
    }
}
