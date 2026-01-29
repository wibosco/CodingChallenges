// Created 16/03/2022.

import XCTest

@testable import LeetCode

final class SortColorsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var nums = [2, 0, 2, 1, 1, 0]
        
        SortColors().sortColors(&nums)
        
        XCTAssertEqual(nums, [0, 0, 1, 1, 2, 2])
    }
    
    func test_B() {
        var nums = [2, 0, 1]
        
        SortColors().sortColors(&nums)
        
        XCTAssertEqual(nums, [0, 1, 2])
    }
}
