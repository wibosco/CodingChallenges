//
//  DuplicateZerosTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/09/2024.
//

import XCTest

@testable import LeetCode

final class DuplicateZerosTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var arr = [1,0,2,3,0,4,5,0]
        
        DuplicateZeros().duplicateZeros(&arr)
        
        XCTAssertEqual(arr, [1,0,0,2,3,0,0,4])
    }
    
    func test_B() {
        var arr = [1,2,3]
        
        DuplicateZeros().duplicateZeros(&arr)
        
        XCTAssertEqual(arr, [1,2,3])
    }
}
