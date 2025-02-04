//
//  ReconstructItineraryTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ReconstructItineraryTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let tickets = [["MUC", "LHR"],
                       ["JFK", "MUC"],
                       ["SFO", "SJC"],
                       ["LHR", "SFO"]]
        
        let result = ReconstructItinerary().findItinerary(tickets)
        
        XCTAssertEqual(result, ["JFK", "MUC", "LHR", "SFO", "SJC"])
    }

    func test_B() {
        let tickets = [["JFK", "SFO"],
                       ["JFK", "ATL"],
                       ["SFO", "ATL"],
                       ["ATL", "JFK"],
                       ["ATL", "SFO"]]
        
        let result = ReconstructItinerary().findItinerary(tickets)
        
        XCTAssertEqual(result, ["JFK", "ATL", "JFK", "SFO", "ATL", "SFO"])
    }
    
    func test_C() {
        let tickets = [["JFK", "KUL"],
                       ["JFK", "NRT"],
                       ["NRT", "JFK"]]
        
        let result = ReconstructItinerary().findItinerary(tickets)
        
        XCTAssertEqual(result, ["JFK", "NRT", "JFK", "KUL"])
    }
}
