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
        
        let isBuddy = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertTrue(isBuddy)
    }
    
    func test_B() {
        let s = "ab"
        let goal = "ab"
        
        let isBuddy = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(isBuddy)
    }
    
    func test_C() {
        let s = "aa"
        let goal = "aa"
        
        let isBuddy = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertTrue(isBuddy)
    }
    
    func test_D() {
        let s = "aabdd"
        let goal = "aabcc"
        
        let isBuddy = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(isBuddy)
    }
    
    func test_E() {
        let s = "aabcc"
        let goal = "aabc"
        
        let isBuddy = BuddyStrings.buddyStrings(s, goal)
        
        XCTAssertFalse(isBuddy)
    }
}
