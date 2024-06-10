//
//  SortArrayByParityIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/06/2024.
//

import XCTest

@testable import LeetCode

final class SortArrayByParityIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [4,2,5,7]
        
        let result = SortArrayByParityII().sortArrayByParityII(nums)
        
        XCTAssertEqual(result, [4,5,2,7])
    }
    
    func test_B() {
        let nums = [2,3]
        
        let result = SortArrayByParityII().sortArrayByParityII(nums)
        
        XCTAssertEqual(result, [2,3])
    }
}
