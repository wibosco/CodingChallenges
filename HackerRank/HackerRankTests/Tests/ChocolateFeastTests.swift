// Created 08/05/2016.


import XCTest

@testable import HackerRank

final class ChocolateFeastTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 10, chocolatePrice: 2, wrapperExchangeThreshold: 5)
        
        XCTAssertEqual(6, chocolatesEaten)
    }
    
    func test_B() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 12, chocolatePrice: 4, wrapperExchangeThreshold: 4)
        
        XCTAssertEqual(3, chocolatesEaten)
    }
    
    func test_C() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 6, chocolatePrice: 2, wrapperExchangeThreshold: 2)
        
        XCTAssertEqual(5, chocolatesEaten)
    }
    
    func test_D() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 43203, chocolatePrice: 60, wrapperExchangeThreshold: 5)
        
        XCTAssertEqual(899, chocolatesEaten)
    }
}
