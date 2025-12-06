// Created 12/07/2016.


import XCTest

@testable import HackerRank

final class MissingNumbersTests: XCTestCase {
    
    // MARK: - Tests
    
    // MARK: Loops
    
    func test_A() {
        let arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        let missing = MissingNumbers.missingNumbers(arr, brr)
        
        XCTAssertEqual([204, 205, 206], missing)
    }
    
    func test_B() {
        let arr = [11, 4, 11, 7, 13, 4, 12, 11, 10, 14]
        let brr = [11, 4, 11, 7, 3, 7, 10, 13, 4, 8, 12, 11, 10, 14, 12]
        
        let missing = MissingNumbers.missingNumbers(arr, brr)
        
        XCTAssertEqual([3, 7, 8, 10, 12], missing)
    }
}
