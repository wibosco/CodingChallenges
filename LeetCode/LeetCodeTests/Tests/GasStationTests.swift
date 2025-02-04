//
//  GasStationTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/03/2022.
//

import XCTest

@testable import LeetCode

final class GasStationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let gas = [1, 2, 3, 4, 5]
        let cost = [3, 4, 5, 1, 2]
        
        let result = GasStation().canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let gas = [2, 3, 4]
        let cost = [3, 4, 3]
        
        let result = GasStation().canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let gas = [4]
        let cost = [5]
        
        let result = GasStation().canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(result, -1)
    }
}
