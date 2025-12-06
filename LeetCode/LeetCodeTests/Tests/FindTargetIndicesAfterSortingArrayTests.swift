// Created 25/02/2024.


import XCTest

@testable import LeetCode

final class FindTargetIndicesAfterSortingArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1,2,5,2,3]
        let target = 2
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [1,2])
    }
    
    func test_B() {
        let nums = [1,2,5,2,3]
        let target = 3
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [3])
    }
    
    func test_C() {
        let nums = [1,2,5,2,3]
        let target = 5
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [4])
    }
    
    func test_D() {
        let nums = [1,2,5,2,3]
        let target = 7
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [Int]())
    }
    
    func test_E() {
        let nums = [48,90,9,21,31,35,19,69,29,52,100,54,21,86,6,45,42,5,62,77,15,38]
        let target = 6
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_F() {
        let nums = [19,35,87,45,93,10,79,41,57,75,66,56,74,25,59,71,19,18,84,28,32,63,73,97,53]
        let target = 8
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [Int]())
    }
    
    func test_G() {
        let nums = [1]
        let target = 2
        
        let result = FindTargetIndicesAfterSortingArray().targetIndices(nums, target)
        
        XCTAssertEqual(result, [Int]())
    }
}
