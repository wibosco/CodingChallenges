//
//  FindAllNumbersDisappearedInAnArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/07/2023.
//

import XCTest

@testable import LeetCode

final class FindAllNumbersDisappearedInAnArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [4, 3, 2, 7, 8, 2, 3, 1]
        
        let result = FindAllNumbersDisappearedInAnArray().findDisappearedNumbers(nums)
        
        XCTAssertEqual(result, [5, 6])
    }
    
    func test_B() {
        let nums = [1, 1]
        
        let result = FindAllNumbersDisappearedInAnArray().findDisappearedNumbers(nums)
        
        XCTAssertEqual(result, [2])
    }
}
