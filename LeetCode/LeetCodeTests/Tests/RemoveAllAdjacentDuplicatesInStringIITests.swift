//
//  RemoveAllAdjacentDuplicatesInStringIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/04/2022.
//

import XCTest

@testable import LeetCode

final class RemoveAllAdjacentDuplicatesInStringIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "abcd"
        let k = 2
        
        let result = RemoveAllAdjacentDuplicatesInStringII.removeDuplicates(s, k)
        
        XCTAssertEqual(result, "abcd")
    }
    
    func test_B() {
        let s = "deeedbbcccbdaa"
        let k = 3
        
        let result = RemoveAllAdjacentDuplicatesInStringII.removeDuplicates(s, k)
        
        XCTAssertEqual(result, "aa")
    }
    
    func test_C() {
        let s = "pbbcggttciiippooaais"
        let k = 2
        
        let result = RemoveAllAdjacentDuplicatesInStringII.removeDuplicates(s, k)
        
        XCTAssertEqual(result, "ps")
    }
    
    func test_D() {
        let s = "yfttttfbbbbnnnnffbgffffgbbbbgssssgthyyyy"
        let k = 4
        
        let result = RemoveAllAdjacentDuplicatesInStringII.removeDuplicates(s, k)
        
        XCTAssertEqual(result, "ybth")
    }
}
