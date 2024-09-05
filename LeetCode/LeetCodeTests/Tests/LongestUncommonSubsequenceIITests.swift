//
//  LongestUncommonSubsequenceIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/09/2024.
//

import XCTest

@testable import LeetCode

final class LongestUncommonSubsequenceIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strs = ["aba","cdc","eae"]
        
        let result = LongestUncommonSubsequenceII().findLUSlength(strs)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let strs = ["aaa","aaa","aa"]
        
        let result = LongestUncommonSubsequenceII().findLUSlength(strs)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let strs = ["aabbcc", "aabbcc","bc","bcc","aabbccc"]
        
        let result = LongestUncommonSubsequenceII().findLUSlength(strs)
        
        XCTAssertEqual(result, 7)
    }
}
