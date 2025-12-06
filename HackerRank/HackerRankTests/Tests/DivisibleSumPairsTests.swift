// Created 28/10/2021.


import XCTest

@testable import HackerRank

final class DivisibleSumPairsTests: XCTestCase {
    // MARK: - Tests
    
    func test_A() {
        let ar = [1, 2, 3, 4, 5, 6]
        let k = 5
        
        let pairsCount = DivisibleSumPairs.divisibleSumPairs(k: k, ar: ar)
        
        XCTAssertEqual(pairsCount, 3)
    }
    
    func test_B() {
        let ar = [1, 3, 2, 6, 1, 2]
        let k = 3
        
        let pairsCount = DivisibleSumPairs.divisibleSumPairs(k: k, ar: ar)
        
        XCTAssertEqual(pairsCount, 5)
    }
}
