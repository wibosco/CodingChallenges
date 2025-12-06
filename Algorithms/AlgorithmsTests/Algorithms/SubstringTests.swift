// Created 11/07/2023.


import XCTest

@testable import Algorithms

final class SubstringTests: XCTestCase {

    //MARK: - Tests
    
    // MARK: Generation DFS
    
    func test_generation_A() {
        let s = "ab"
        
        let result = Substring.generateSubstrings(s)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertTrue(result.contains("a"))
        XCTAssertTrue(result.contains("b"))
        XCTAssertTrue(result.contains("ab"))
    }
    
    func test_generation_B() {
        let s = "abcd"
        
        let result = Substring.generateSubstrings(s)
        
        XCTAssertEqual(result.count, 10)
        
        XCTAssertTrue(result.contains("a"))
        XCTAssertTrue(result.contains("b"))
        XCTAssertTrue(result.contains("c"))
        XCTAssertTrue(result.contains("d"))
        XCTAssertTrue(result.contains("ab"))
        XCTAssertTrue(result.contains("bc"))
        XCTAssertTrue(result.contains("cd"))
        XCTAssertTrue(result.contains("abc"))
        XCTAssertTrue(result.contains("bcd"))
        XCTAssertTrue(result.contains("abcd"))
    }
    
    // MARK: Generation For
    
    func test_generation_usingDFS_A() {
        let s = "ab"
        
        let result = Substring.generateSubstringsUsingNestedForLoops(s)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertEqual(result[0], "a")
        XCTAssertEqual(result[1], "ab")
        XCTAssertEqual(result[2], "b")
    }
    
    func test_generation_usingDFS_B() {
        let s = "abcd"
        
        let result = Substring.generateSubstringsUsingNestedForLoops(s)
        
        XCTAssertEqual(result.count, 10)
        
        XCTAssertEqual(result[0], "a")
        XCTAssertEqual(result[1], "ab")
        XCTAssertEqual(result[2], "abc")
        XCTAssertEqual(result[3], "abcd")
        XCTAssertEqual(result[4], "b")
        XCTAssertEqual(result[5], "bc")
        XCTAssertEqual(result[6], "bcd")
        XCTAssertEqual(result[7], "c")
        XCTAssertEqual(result[8], "cd")
        XCTAssertEqual(result[9], "d")
    }
    
    // MARK: Count
    
    func test_count_A() {
        let s = "ab"
        
        let result = Substring.countSubstrings(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_count_B() {
        let s = "abcd"
        
        let result = Substring.countSubstrings(s)
        
        XCTAssertEqual(result, 10)
    }
}
