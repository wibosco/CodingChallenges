//
//  SortAnArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/05/2022.
//

import XCTest

@testable import LeetCode

final class SortAnArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [5, 2, 3, 1]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [1, 2, 3, 5])
    }
    
    func test_B() {
        let nums = [5, 1, 1, 2, 0, 0]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [0, 0, 1, 1, 2, 5])
    }
    
    func test_C() {
        let nums = [0]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [0])
    }
    
    func test_D() {
        let nums = [5, 1, 1, 2, 0, -4]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [-4, 0, 1, 1, 2, 5])
    }
    
    func test_E() {
        let nums = [5, 8, 1, 3, 7, 9, 2]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [1, 2, 3, 5, 7, 8, 9])
    }
    
    func test_F() {
        let nums = [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25])
    }
    
    func test_G() {
        let nums = [5, 8, 1, 3, 7, 5, 9, 2, 9]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [1, 2, 3, 5, 5, 7, 8, 9, 9])
    }
    
    func test_H() {
        let nums = [4, 7, 2, 6, 1, 2]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [1, 2, 2, 4, 6, 7])
    }
    
    func test_I() {
        let nums = [-2, 3, -5]
        
        let result = SortAnArray().sortArray(nums)
        
        XCTAssertEqual(result, [-5, -2, 3])
    }
}
