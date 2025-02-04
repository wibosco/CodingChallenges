//
//  RemoveDuplicatesFromSortedArrayIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/03/2022.
//

import XCTest

@testable import LeetCode

final class RemoveDuplicatesFromSortedArrayIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums = [1, 1, 1, 2, 2, 3]
        
        let result = RemoveDuplicatesFromSortedArrayII().removeDuplicates(&nums)
        
        XCTAssertEqual(result, 5)
        XCTAssertEqual(Array(nums[0..<result]), [1, 1, 2, 2, 3])
    }
    
    func test_B() {
        var nums = [0, 0, 1, 1, 1, 1, 2, 3, 3]
        
        let result = RemoveDuplicatesFromSortedArrayII().removeDuplicates(&nums)
        
        XCTAssertEqual(result, 7)
        XCTAssertEqual(Array(nums[0..<result]), [0, 0, 1, 1, 2, 3, 3])
    }
}
