//
//  MinimumPenaltyForAShopTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/11/2023.
//

import XCTest

@testable import LeetCode

final class MinimumPenaltyForAShopTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let customers = "YYNY"
        
        let result = MinimumPenaltyForAShop.bestClosingTime(customers)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let customers = "NNNNN"
        
        let result = MinimumPenaltyForAShop.bestClosingTime(customers)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let customers = "YYYY"
        
        let result = MinimumPenaltyForAShop.bestClosingTime(customers)
        
        XCTAssertEqual(result, 4)
    }
}
