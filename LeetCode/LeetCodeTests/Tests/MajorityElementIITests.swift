//
//  MajorityElementIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/02/2022.
//

import XCTest

@testable import LeetCode

class MajorityElementIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 2, 3]
        
        let elements = MajorityElementII.majorityElement(nums)
        
        XCTAssertEqual(elements, [3])
    }
    
    func test_B() {
        let nums = [1]
        
        let elements = MajorityElementII.majorityElement(nums)
        
        XCTAssertEqual(elements, [1])
    }
    
    func test_C() {
        let nums = [1, 2]
        
        let elements = MajorityElementII.majorityElement(nums)
        
        XCTAssertEqual(elements, [1, 2])
    }
}
