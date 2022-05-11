//
//  CountSortedVowelStringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/05/2022.
//

import XCTest

@testable import LeetCode

class CountSortedVowelStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 1
        
        let count = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(count, 5)
    }
    
    func test_B() {
        let n = 2
        
        let count = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(count, 15)
    }
    
    func test_C() {
        let n = 33
        
        let count = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(count, 66045)
    }
}
