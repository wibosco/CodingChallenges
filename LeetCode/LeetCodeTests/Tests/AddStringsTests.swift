//
//  AddStringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class AddStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num1 = "11"
        let num2 = "123"
        
        let sum = AddStrings.addStrings(num1, num2)
        
        XCTAssertEqual(sum, "134")
    }
    
    func test_B() {
        let num1 = "456"
        let num2 = "77"
        
        let sum = AddStrings.addStrings(num1, num2)
        
        XCTAssertEqual(sum, "533")
    }
    
    func test_C() {
        let num1 = "0"
        let num2 = "0"
        
        let sum = AddStrings.addStrings(num1, num2)
        
        XCTAssertEqual(sum, "0")
    }
    
    func test_D() {
        let num1 = "925101087184894"
        let num2 = "3896737933784656127"
        
        let sum = AddStrings.addStrings(num1, num2)
        
        XCTAssertEqual(sum, "3897663034871841021")
    }
}
