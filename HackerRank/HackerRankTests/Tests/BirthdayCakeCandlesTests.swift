// Created 27/10/2021.


import XCTest

@testable import HackerRank

final class BirthdayCakeCandlesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let candles = [4, 4, 1, 3]
        let count = BirthdayCakeCandles.countOfTallestCandles(candles)
        
        XCTAssertEqual(count, 2)
    }
    
    func test_B() {
        let candles = [3, 2, 1, 3]
        let count = BirthdayCakeCandles.countOfTallestCandles(candles)
        
        XCTAssertEqual(count, 2)
    }
}
