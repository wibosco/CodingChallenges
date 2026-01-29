// Created 06/04/2023.

import XCTest

@testable import LeetCode

final class CoinChangeTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let coins = [1, 2, 5]
        let amount = 11
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, 3)
    }
        
    func test_B() {
        let coins = [2]
        let amount = 3
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let coins = [1]
        let amount = 0
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let coins = [1, 2, 5]
        let amount = 100
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, 20)
    }
    
    func test_E() {
        let coins = [186, 419, 83, 408]
        let amount = 6249
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, 20)
    }
    
    func test_F() {
        let coins = [1, 3, 4, 5]
        let amount = 7
        
        let result = CoinChange().coinChange(coins, amount)
        
        XCTAssertEqual(result, 2)
    }
}
