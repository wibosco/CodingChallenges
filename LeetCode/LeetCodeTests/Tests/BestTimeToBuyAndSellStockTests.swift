// Created 31/01/2022.

import XCTest

@testable import LeetCode

final class BestTimeToBuyAndSellStockTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let prices = [7, 1, 5, 3, 6, 4]
        
        let result = BestTimeToBuyAndSellStock().maxProfit(prices)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let prices = [7, 6, 4, 3, 1]
        
        let result = BestTimeToBuyAndSellStock().maxProfit(prices)
        
        XCTAssertEqual(result, 0)
    }
}
