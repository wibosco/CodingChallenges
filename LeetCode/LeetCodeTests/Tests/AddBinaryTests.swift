//
//  AddBinaryTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/03/2022.
//

import XCTest

@testable import LeetCode

class AddBinaryTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let a = "11"
        let b = "1"
        
        let sum = AddBinary.addBinary(a, b)
        
        XCTAssertEqual(sum, "100")
    }
    
    func test_B() {
        let a = "1010"
        let b = "1011"
        
        let sum = AddBinary.addBinary(a, b)
        
        XCTAssertEqual(sum, "10101")
    }
}
