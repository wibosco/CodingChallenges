// Created 10/04/2023.

import XCTest

@testable import LeetCode

final class LongestConsecutiveSequenceTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [100, 4, 200, 1, 3, 2]
        
        let result = LongestConsecutiveSequence().longestConsecutive(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]
        
        let result = LongestConsecutiveSequence().longestConsecutive(nums)
        
        XCTAssertEqual(result, 9)
    }
}
