//
//  BestTimeToBuyAndSellStockIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/02/2022.
//

import XCTest

@testable import LeetCode

final class BestTimeToBuyAndSellStockIITests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let prices = [7, 1, 5, 3, 6, 4]
        
        let profit = BestTimeToBuyAndSellStockII.maxProfit(prices)
        
        XCTAssertEqual(profit, 7)
    }
    
    func test_B() {
        let prices = [1, 2, 3, 4, 5]
        
        let profit = BestTimeToBuyAndSellStockII.maxProfit(prices)
        
        XCTAssertEqual(profit, 4)
    }
    
    func test_C() {
        let prices = [7, 6, 4, 3, 1]
        
        let profit = BestTimeToBuyAndSellStockII.maxProfit(prices)
        
        XCTAssertEqual(profit, 0)
    }
}
