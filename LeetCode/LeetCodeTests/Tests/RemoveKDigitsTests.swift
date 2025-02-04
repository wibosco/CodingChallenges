//
//  RemoveKDigitsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/07/2023.
//

import XCTest

@testable import LeetCode

final class RemoveKDigitsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let num = "1432219"
        let k = 3
            
        let result = RemoveKDigits().removeKdigits(num, k)
        
        XCTAssertEqual(result, "1219")
    }
    
    func test_B() {
        let num = "10"
        let k = 2
            
        let result = RemoveKDigits().removeKdigits(num, k)
        
        XCTAssertEqual(result, "0")
    }
    
    func test_C() {
        let num = "10200"
        let k = 1
            
        let result = RemoveKDigits().removeKdigits(num, k)
        
        XCTAssertEqual(result, "200") //0200 is the same as 200
    }
    
    func test_D() {
        let num = "10"
        let k = 1
            
        let result = RemoveKDigits().removeKdigits(num, k)
        
        XCTAssertEqual(result, "0")
    }
    
    func test_E() {
        let num = "9"
        let k = 1
            
        let result = RemoveKDigits().removeKdigits(num, k)
        
        XCTAssertEqual(result, "0")
    }
}
