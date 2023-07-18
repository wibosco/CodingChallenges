//
//  SubstringTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 11/07/2023.
//

import XCTest

@testable import Algorithms

final class SubstringTests: XCTestCase {

    //MARK: - Tests
    
    // MARK: Generation
    
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
