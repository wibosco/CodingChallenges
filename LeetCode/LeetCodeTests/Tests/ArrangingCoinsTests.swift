//
//  ArrangingCoinsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/07/2023.
//

import XCTest

@testable import LeetCode

final class ArrangingCoinsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 5
        
        let result = ArrangingCoins().arrangeCoins(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let n = 8
        
        let result = ArrangingCoins().arrangeCoins(n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let n = 1
        
        let result = ArrangingCoins().arrangeCoins(n)
        
        XCTAssertEqual(result, 1)
    }
}
