//
//  InterleavingStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/03/2022.
//

import XCTest

@testable import LeetCode

class InterleavingStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s1 = "aabcc"
        let s2 = "dbbca"
        let s3 = "aadbbcbcac"
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertTrue(interleaving)
    }
    
    func test_B() {
        let s1 = "aabcc"
        let s2 = "dbbca"
        let s3 = "aadbbbaccc"
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertFalse(interleaving)
    }
    
    func test_C() {
        let s1 = ""
        let s2 = ""
        let s3 = ""
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertTrue(interleaving)
    }
    
    func test_D() {
        let s1 = "a"
        let s2 = ""
        let s3 = "c"
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertFalse(interleaving)
    }
    
    func test_E() {
        let s1 = "abababababababababababababababababababababababababababababababababababababababababababababababababbb"
        let s2 = "babababababababababababababababababababababababababababababababababababababababababababababababaaaba"
        let s3 = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababbb"
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertFalse(interleaving)
    }
    
    func test_F() {
        let s1 = "ab"
        let s2 = "babababab"
        let s3 = "ababababababa"
        
        let interleaving = InterleavingString.isInterleave(s1, s2, s3)
        
        XCTAssertFalse(interleaving)
    }
}
