//
//  RemoveElementTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/02/2022.
//

import XCTest

@testable import LeetCode

final class RemoveElementTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums = [3, 2, 2, 3]
        let val = 3
        
        let result = RemoveElement.removeElement(&nums, val)
        
        XCTAssertEqual(result, 2)
        XCTAssertEqual(nums[0..<result], [2, 2])
    }
    
    func test_B() {
        var nums = [0, 1, 2, 2, 3, 0, 4, 2]
        let val = 2
        
        let result = RemoveElement.removeElement(&nums, val)
        
        XCTAssertEqual(result, 5)
        XCTAssertEqual(nums[0..<result], [0, 1, 3, 0, 4])
    }
    
    func test_C() {
        var nums = [1]
        let val = 1
        
        let result = RemoveElement.removeElement(&nums, val)
        
        XCTAssertEqual(result, 0)
    }
}
