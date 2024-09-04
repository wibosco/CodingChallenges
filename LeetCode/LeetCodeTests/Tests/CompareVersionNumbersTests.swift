//
//  CompareVersionNumbersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/09/2024.
//

import XCTest

@testable import LeetCode

final class CompareVersionNumbersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let version1 = "1.2"
        let version2 = "1.10"
            
        let result = CompareVersionNumbers().compareVersion(version1, version2)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_B() {
        let version1 = "1.01"
        let version2 = "1.001"
            
        let result = CompareVersionNumbers().compareVersion(version1, version2)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let version1 = "1.0"
        let version2 = "1.0.0.0"
            
        let result = CompareVersionNumbers().compareVersion(version1, version2)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let version1 = "1.0"
        let version2 = "1.0.0.0.1"
            
        let result = CompareVersionNumbers().compareVersion(version1, version2)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_E() {
        let version1 = "1.0.0.0.1"
        let version2 = "1.0"
            
        let result = CompareVersionNumbers().compareVersion(version1, version2)
        
        XCTAssertEqual(result, 1)
    }
}
