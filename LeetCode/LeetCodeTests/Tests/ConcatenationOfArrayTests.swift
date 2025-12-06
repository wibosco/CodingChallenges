// Created 06/07/2023.


import XCTest

@testable import LeetCode

final class ConcatenationOfArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 1]
        
        let result = ConcatenationOfArray().getConcatenation(nums)
        
        XCTAssertEqual(result, [1, 2, 1, 1, 2, 1])
    }
    
    func test_B() {
        let nums = [1, 3, 2, 1]
        
        let result = ConcatenationOfArray().getConcatenation(nums)
        
        XCTAssertEqual(result, [1, 3, 2, 1, 1, 3, 2, 1])
    }
}
