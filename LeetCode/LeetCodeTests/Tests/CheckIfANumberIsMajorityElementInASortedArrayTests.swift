//
//  CheckIfANumberIsMajorityElementInASortedArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/03/2024.
//

import XCTest

@testable import LeetCode

final class CheckIfANumberIsMajorityElementInASortedArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2,4,5,5,5,5,5,6,6]
        let target = 5
        
        let result = CheckIfANumberIsMajorityElementInASortedArray().isMajorityElement(nums, target)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [10,100,101,101]
        let target = 101
        
        let result = CheckIfANumberIsMajorityElementInASortedArray().isMajorityElement(nums, target)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [2,4,5,5,5,5,5]
        let target = 5
        
        let result = CheckIfANumberIsMajorityElementInASortedArray().isMajorityElement(nums, target)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let nums = [2]
        let target = 7
        
        let result = CheckIfANumberIsMajorityElementInASortedArray().isMajorityElement(nums, target)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let nums = [7]
        let target = 7
        
        let result = CheckIfANumberIsMajorityElementInASortedArray().isMajorityElement(nums, target)
        
        XCTAssertTrue(result)
    }
}
