// Created 24/03/2022.


import XCTest

@testable import LeetCode

final class InterleavingStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s1 = "aabcc"
        let s2 = "dbbca"
        let s3 = "aadbbcbcac"
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s1 = "aabcc"
        let s2 = "dbbca"
        let s3 = "aadbbbaccc"
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s1 = ""
        let s2 = ""
        let s3 = ""
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let s1 = "a"
        let s2 = ""
        let s3 = "c"
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let s1 = "abababababababababababababababababababababababababababababababababababababababababababababababababbb"
        let s2 = "babababababababababababababababababababababababababababababababababababababababababababababababaaaba"
        let s3 = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababbb"
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertFalse(result)
    }
    
    func test_F() {
        let s1 = "ab"
        let s2 = "babababab"
        let s3 = "ababababababa"
        
        let result = InterleavingString().isInterleave(s1, s2, s3)
        
        XCTAssertFalse(result)
    }
}
