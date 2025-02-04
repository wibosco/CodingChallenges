//
//  SingleElementInASortedArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/07/2023.
//

import XCTest

@testable import LeetCode

final class SingleElementInASortedArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 1, 2, 3, 3, 4, 4, 8, 8]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [3, 3, 7, 7, 10, 11, 11]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 10)
    }
    
    func test_C() {
        let nums = [1]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let nums = [1, 1, 2]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let nums = [1, 2, 2, 3, 3]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_F() {
        let nums = [2, 2, 3, 3, 4]
        
        let result = SingleElementInASortedArray().singleNonDuplicate(nums)
        
        XCTAssertEqual(result, 4)
    }
}
