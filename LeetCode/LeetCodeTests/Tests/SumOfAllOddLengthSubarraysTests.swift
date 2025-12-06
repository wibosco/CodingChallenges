// Created 04/02/2022.


import XCTest

@testable import LeetCode

final class SumOfAllOddLengthSubarraysTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let arr = [1, 4, 2, 5, 3]
        
        let result = SumOfAllOddLengthSubarrays().sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(result, 58)
    }
    
    func test_B() {
        let arr = [1, 2]
        
        let result = SumOfAllOddLengthSubarrays().sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let arr = [10, 11, 12]
        
        let result = SumOfAllOddLengthSubarrays().sumOddLengthSubarrays(arr)
        
        XCTAssertEqual(result, 66)
    }
}
