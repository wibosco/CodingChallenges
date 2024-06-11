//
//  ApplyOperationsToAnArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/06/2024.
//

import XCTest

@testable import LeetCode

final class ApplyOperationsToAnArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1,2,2,1,1,0]
        
        let result = ApplyOperationsToAnArray().applyOperations(nums)
        
        XCTAssertEqual(result, [1,4,2,0,0,0])
    }
    
    func test_B() {
        let nums = [0,1]
        
        let result = ApplyOperationsToAnArray().applyOperations(nums)
        
        XCTAssertEqual(result, [1,0])
    }
    
    func test_C() {
        let nums = [1,2,2,1,1,9]
        
        let result = ApplyOperationsToAnArray().applyOperations(nums)
        
        XCTAssertEqual(result, [1,4,2,9,0,0])
    }
}
