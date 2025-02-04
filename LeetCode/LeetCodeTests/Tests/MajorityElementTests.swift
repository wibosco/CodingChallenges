//
//  MajorityElementTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/02/2022.
//

import XCTest

@testable import LeetCode

final class MajorityElementTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 2, 3]
        
        let result = MajorityElement().majorityElement(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [2, 2, 1, 1, 1, 2, 2]
        
        let result = MajorityElement().majorityElement(nums)
        
        XCTAssertEqual(result, 2)
    }
}
