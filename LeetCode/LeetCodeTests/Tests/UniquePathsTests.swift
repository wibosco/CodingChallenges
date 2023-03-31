//
//  UniquePathsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/03/2022.
//

import XCTest

@testable import LeetCode

final class UniquePathsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let m = 3
        let n = 7
        
        let paths = UniquePaths.uniquePaths(m, n)
        
        XCTAssertEqual(paths, 28)
    }
    
    func test_B() {
        let m = 3
        let n = 2
        
        let paths = UniquePaths.uniquePaths(m, n)
        
        XCTAssertEqual(paths, 3)
    }
    
    func test_C() {
        let m = 19
        let n = 13
        
        let paths = UniquePaths.uniquePaths(m, n)
        
        XCTAssertEqual(paths, 86493225)
    }
}
