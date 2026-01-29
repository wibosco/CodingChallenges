// Created 11/07/2023.

import XCTest

@testable import Algorithms

final class SubsequenceTests: XCTestCase {

    //MARK: - Tests
    
    // MARK: Generation
    
    func test_generation_A() {
        let s = "ab"
        
        let result = Subsequence.generateSubsequences(s)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertTrue(result.contains("a"))
        XCTAssertTrue(result.contains("b"))
        XCTAssertTrue(result.contains("ab"))
    }
    
    func test_generation_B() {
        let s = "abcd"
        
        let result = Subsequence.generateSubsequences(s)
        
        XCTAssertEqual(result.count, 15)
        
        XCTAssertTrue(result.contains("a"))
        XCTAssertTrue(result.contains("b"))
        XCTAssertTrue(result.contains("c"))
        XCTAssertTrue(result.contains("d"))
        XCTAssertTrue(result.contains("ab"))
        XCTAssertTrue(result.contains("ac"))
        XCTAssertTrue(result.contains("ad"))
        XCTAssertTrue(result.contains("bc"))
        XCTAssertTrue(result.contains("bd"))
        XCTAssertTrue(result.contains("cd"))
        XCTAssertTrue(result.contains("abc"))
        XCTAssertTrue(result.contains("abd"))
        XCTAssertTrue(result.contains("acd"))
        XCTAssertTrue(result.contains("bcd"))
        XCTAssertTrue(result.contains("abcd"))
    }
    
    // MARK: Count
    
    func test_count_A() {
        let s = "ab"
        
        let result = Subsequence.countSubsequences(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_count_B() {
        let s = "abcd"
        
        let result = Subsequence.countSubsequences(s)
        
        XCTAssertEqual(result, 15)
    }
    
    // MARK: - Check
    
    func test_check_A() {
        let a = "abcd"
        let b = "abc"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertTrue(result)
    }
    
    func test_check_B() {
        let a = "abcd"
        let b = "ac"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertTrue(result)
    }
    
    func test_check_C() {
        let a = "abcd"
        let b = "bd"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertTrue(result)
    }
    
    func test_check_D() {
        let a = "abcd"
        let b = "zn"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertFalse(result)
    }
    
    func test_check_E() {
        let a = "abcd"
        let b = "abcn"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertFalse(result)
    }
    
    func test_check_F() {
        let a = "abcd"
        let b = "abcde"
        
        let result = Subsequence.isSubsequence(b, of: a)
        
        XCTAssertFalse(result)
    }
}
