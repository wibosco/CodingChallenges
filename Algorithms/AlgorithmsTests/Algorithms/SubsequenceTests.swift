//
//  SubsequenceTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 11/07/2023.
//

import XCTest

@testable import Algorithms

final class SubsequenceTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "ab"
        
        let result = Subsequence.generateSubsequences(s)
        
        XCTAssertEqual(result.count, 3)
        
        XCTAssertTrue(result.contains("a"))
        XCTAssertTrue(result.contains("b"))
        XCTAssertTrue(result.contains("ab"))
    }
    
    func test_B() {
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
}
