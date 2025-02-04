//
//  ContainsDuplicateTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/04/2023.
//

import XCTest

@testable import LeetCode

final class ContainsDuplicateTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 1]
        
        let result = ContainsDuplicate().containsDuplicate(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [1, 2, 3, 4]
        
        let result = ContainsDuplicate().containsDuplicate(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
        
        let result = ContainsDuplicate().containsDuplicate(nums)
        
        XCTAssertTrue(result)
    }
}
