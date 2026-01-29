// Created 08/04/2023.

import XCTest

@testable import LeetCode

final class IncreasingTripletSubsequenceTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4, 5]
        
        let result = IncreasingTripletSubsequence().increasingTriplet(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [5, 4, 3, 2, 1]
        
        let result = IncreasingTripletSubsequence().increasingTriplet(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [2, 1, 5, 0, 4, 6]
        
        let result = IncreasingTripletSubsequence().increasingTriplet(nums)
        
        XCTAssertTrue(result)
    }
}
