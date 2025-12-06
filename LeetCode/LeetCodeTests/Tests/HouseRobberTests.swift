// Created 13/04/2023.


import XCTest

@testable import LeetCode

final class HouseRobberTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 1]
        
        let result = HouseRobber().rob(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let nums = [2, 7, 9, 3, 1]
        
        let result = HouseRobber().rob(nums)
        
        XCTAssertEqual(result, 12)
    }
    
    func test_C() {
        let nums = [114, 117, 207, 117, 235, 82, 90, 67, 143, 146, 53, 108, 200]
        
        let result = HouseRobber().rob(nums)
        
        XCTAssertEqual(result, 1042)
    }
    
    func test_D() {
        let nums = [2, 1, 1, 2]
        
        let result = HouseRobber().rob(nums)
        
        XCTAssertEqual(result, 4)
    }
}
