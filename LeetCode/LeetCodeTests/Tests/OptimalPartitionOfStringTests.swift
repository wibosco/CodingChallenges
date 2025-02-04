//
//  OptimalPartitionOfStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/07/2023.
//

import XCTest

@testable import LeetCode

final class OptimalPartitionOfStringTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let s = "abacaba"
        
        let result = OptimalPartitionOfString().partitionString(s)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let s = "ssssss"
        
        let result = OptimalPartitionOfString().partitionString(s)
        
        XCTAssertEqual(result, 6)
    }
}
