// Created 11/06/2024.


import XCTest

@testable import LeetCode

final class FindAllKDistantIndicesInAnArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3,4,9,1,3,9,5]
        let key = 9
        let k = 1
        
        let result = FindAllKDistantIndicesInAnArray().findKDistantIndices(nums, key, k)
        
        XCTAssertEqual(result, [1,2,3,4,5,6])
    }
    
    func test_B() {
        let nums = [2,2,2,2,2]
        let key = 2
        let k = 2
        
        let result = FindAllKDistantIndicesInAnArray().findKDistantIndices(nums, key, k)
        
        XCTAssertEqual(result, [0,1,2,3,4])
    }
}
