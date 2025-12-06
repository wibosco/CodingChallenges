// Created 14/07/2023.


import XCTest

@testable import LeetCode

final class CheckIfAStringContainsAllBinaryCodesOfSizeKTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "00110110"
        let k = 2
            
        let result = CheckIfAStringContainsAllBinaryCodesOfSizeK().hasAllCodes(s, k)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "0110"
        let k = 1
            
        let result = CheckIfAStringContainsAllBinaryCodesOfSizeK().hasAllCodes(s, k)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "0110"
        let k = 2
            
        let result = CheckIfAStringContainsAllBinaryCodesOfSizeK().hasAllCodes(s, k)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let s = "00110"
        let k = 2
            
        let result = CheckIfAStringContainsAllBinaryCodesOfSizeK().hasAllCodes(s, k)
        
        XCTAssertTrue(result)
    }
}
