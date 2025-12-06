// Created 23/02/2024.


import XCTest

@testable import LeetCode

final class CheckIfNAndItsDoubleExistTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let arr = [10,2,5,3]
        
        let result = CheckIfNAndItsDoubleExist().checkIfExist(arr)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let arr = [3,1,7,11]
        
        let result = CheckIfNAndItsDoubleExist().checkIfExist(arr)
        
        XCTAssertFalse(result)
    }
}
