//
//  BestTimeToBuyAndSellStockTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/01/2022.
//

import XCTest

@testable import LeetCode

class BestTimeToBuyAndSellStockTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let prices = [7, 1, 5, 3, 6, 4]
        
        let maxProfit = BestTimeToBuyAndSellStock.maxProfit(prices)
        
        XCTAssertEqual(maxProfit, 5)
    }
    
    func test_B() {
        let prices = [7, 6, 4, 3, 1]
        
        let maxProfit = BestTimeToBuyAndSellStock.maxProfit(prices)
        
        XCTAssertEqual(maxProfit, 0)
    }
}
