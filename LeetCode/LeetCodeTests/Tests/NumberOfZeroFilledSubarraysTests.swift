// Created 15/07/2023.

import XCTest

@testable import LeetCode

final class NumberOfZeroFilledSubarraysTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 3, 0, 0, 2, 0, 0, 4]
        
        let result = NumberOfZeroFilledSubarrays().zeroFilledSubarray(nums)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let nums = [0, 0, 0, 2, 0, 0]
        
        let result = NumberOfZeroFilledSubarrays().zeroFilledSubarray(nums)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_C() {
        let nums = [2, 10, 2019]
        
        let result = NumberOfZeroFilledSubarrays().zeroFilledSubarray(nums)
        
        XCTAssertEqual(result, 0)
    }
}
