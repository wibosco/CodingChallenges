//
//  IsomorphicStrings.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/07/2023.
//

import XCTest

@testable import LeetCode

final class IsomorphicStringsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "egg"
        let t = "add"
        
        let result = IsomorphicStrings().isIsomorphic(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "foo"
        let t = "bar"
        
        let result = IsomorphicStrings().isIsomorphic(s, t)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = "paper"
        let t = "title"
        
        let result = IsomorphicStrings().isIsomorphic(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let s = "badc"
        let t = "baba"
        
        let result = IsomorphicStrings().isIsomorphic(s, t)
        
        XCTAssertFalse(result)
    }
}
