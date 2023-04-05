//
//  AdditiveNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/04/2023.
//

import XCTest

@testable import LeetCode

final class AdditiveNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = "112358" // 1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_B() {
        let num = "199100199" //1 + 99 = 100, 99 + 100 = 199
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_C() {
        let num = "1023"
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertFalse(isAdditiveNumber)
    }
    
    func test_D() {
        let num = "1203"
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertFalse(isAdditiveNumber)
    }
    
    func test_E() {
        let num = "101" //1 + 0 = 1
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_F() {
        let num = "211738" // 21 + 17 = 38
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_G() {
        let num = "199111992" // 1991 + 1 = 1992
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_H() {
        let num = "12012122436" //12 + 0 = 12, 0 + 12 = 12, 12 + 12 = 24, 12 + 23 = 36
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_I() {
        let num = "198019823962" //1980 + 1982 = 3962
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_J() {
        let num = "112" //1 + 1 = 2
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
    
    func test_K() {
        let num = "199100" //1 + 99 = 100
        
        let isAdditiveNumber = AdditiveNumber.isAdditiveNumber(num)
        
        XCTAssertTrue(isAdditiveNumber)
    }
}
