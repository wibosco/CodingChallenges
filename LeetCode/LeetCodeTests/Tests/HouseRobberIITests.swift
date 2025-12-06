// Created 13/04/2023.


import XCTest

@testable import LeetCode

final class HouseRobberIITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, 2]
        
        let result = HouseRobberII().rob(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        //pre = [1,2,3]
        //suf = [2,3,1]
        //nums = [1,2,3,1]
        let nums = [1, 2, 3, 1]
        
        let result = HouseRobberII().rob(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let nums = [1, 2, 3]
        
        let result = HouseRobberII().rob(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        //                X     X        X     X
        let nums = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
        
        let result = HouseRobberII().rob(nums)
        
        XCTAssertEqual(result, 16)
    }
}
