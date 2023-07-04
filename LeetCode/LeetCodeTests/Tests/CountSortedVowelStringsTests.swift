//
//  CountSortedVowelStringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/05/2022.
//

import XCTest

@testable import LeetCode

final class CountSortedVowelStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 1
        
        let result = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let n = 2
        
        let result = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_C() {
        let n = 33
        
        let result = CountSortedVowelStrings.countVowelStrings(n)
        
        XCTAssertEqual(result, 66045)
    }
}
