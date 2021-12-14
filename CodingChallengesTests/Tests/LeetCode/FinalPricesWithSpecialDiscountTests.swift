//
//  FinalPricesWithSpecialDiscountTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class FinalPricesWithSpecialDiscountTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let prices = [8, 4, 6, 2, 3]
        
        let finalPrices = FinalPricesWithSpecialDiscount.finalPrices(prices)
        
        XCTAssertEqual(finalPrices, [4, 2, 4, 2, 3])
    }
    
    func test_B() {
        let prices = [1, 2, 3, 4, 5]
        
        let finalPrices = FinalPricesWithSpecialDiscount.finalPrices(prices)
        
        XCTAssertEqual(finalPrices, [1, 2, 3, 4, 5])
    }
    
    func test_C() {
        let prices = [10, 1, 1, 6]
        
        let finalPrices = FinalPricesWithSpecialDiscount.finalPrices(prices)
        
        XCTAssertEqual(finalPrices, [9, 0, 1, 6])
    }
    
    func test_D() {
        let prices = [8, 7, 4, 2, 8, 1, 7, 7, 10, 1]
        
        let finalPrices = FinalPricesWithSpecialDiscount.finalPrices(prices)
        
        XCTAssertEqual(finalPrices, [1, 3, 2, 1, 7, 0, 0, 6, 9, 1])
    }
}
