//
//  GasStationTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/03/2022.
//

import XCTest

@testable import LeetCode

class GasStationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let gas = [1, 2, 3, 4, 5]
        let cost = [3, 4, 5, 1, 2]
        
        let station = GasStation.canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(station, 3)
    }
    
    func test_B() {
        let gas = [2, 3, 4]
        let cost = [3, 4, 3]
        
        let station = GasStation.canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(station, -1)
    }
    
    func test_C() {
        let gas = [4]
        let cost = [5]
        
        let station = GasStation.canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(station, -1)
    }
}