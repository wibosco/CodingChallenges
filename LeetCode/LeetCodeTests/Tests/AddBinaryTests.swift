// Created 16/03/2022.


import XCTest

@testable import LeetCode

final class AddBinaryTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let a = "11"
        let b = "1"
        
        let result = AddBinary().addBinary(a, b)
        
        XCTAssertEqual(result, "100")
    }
    
    func test_B() {
        let a = "1010"
        let b = "1011"
        
        let result = AddBinary().addBinary(a, b)
        
        XCTAssertEqual(result, "10101")
    }
}
