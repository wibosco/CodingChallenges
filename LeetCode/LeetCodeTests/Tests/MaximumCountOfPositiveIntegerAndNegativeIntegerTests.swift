//
//  MaximumCountOfPositiveIntegerAndNegativeIntegerTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/02/2024.
//

import XCTest

@testable import LeetCode

final class MaximumCountOfPositiveIntegerAndNegativeIntegerTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [-2,-1,-1,1,2,3]
        
        let result = MaximumCountOfPositiveIntegerAndNegativeInteger().maximumCount(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [-3,-2,-1,0,0,1,2]
        
        let result = MaximumCountOfPositiveIntegerAndNegativeInteger().maximumCount(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let nums = [5,20,66,1314]
        
        let result = MaximumCountOfPositiveIntegerAndNegativeInteger().maximumCount(nums)
        
        XCTAssertEqual(result, 4)
    }
}
