//
//  MinimumFuelCostToReportToTheCapitalTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/10/2023.
//

import XCTest

@testable import LeetCode

final class MinimumFuelCostToReportToTheCapitalTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let roads = [[0,1],
                     [0,2],
                     [0,3]]
        let seats = 5
            
        let result = MinimumFuelCostToReportToTheCapital().minimumFuelCost(roads, seats)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let roads = [[3,1],
                     [3,2],
                     [1,0],
                     [0,4],
                     [0,5],
                     [4,6]]
        let seats = 2
            
        let result = MinimumFuelCostToReportToTheCapital().minimumFuelCost(roads, seats)
        
        XCTAssertEqual(result, 7)
    }
}
