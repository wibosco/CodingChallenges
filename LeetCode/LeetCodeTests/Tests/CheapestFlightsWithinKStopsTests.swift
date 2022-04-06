//
//  CheapestFlightsWithinKStopsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/04/2022.
//

import XCTest

@testable import LeetCode

class CheapestFlightsWithinKStopsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 4
        let flights = [[0, 1, 100], [1, 2, 100], [2, 0, 100], [1, 3, 600], [2, 3, 200]]
        let src = 0
        let dst = 3
        let k = 1
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, 700)
    }
    
    func test_B() {
        let n = 3
        let flights = [[0, 1, 100], [1, 2, 100], [0, 2, 500]]
        let src = 0
        let dst = 2
        let k = 1
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, 200)
    }
    
    func test_C() {
        let n = 3
        let flights = [[0, 1, 100], [1, 2, 100], [0, 2, 500]]
        let src = 0
        let dst = 2
        let k = 0
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, 500)
    }
    
    func test_D() {
        let n = 10
        let flights = [[3, 4, 4], [2, 5, 6], [4, 7, 10], [9, 6, 5], [7, 4, 4], [6, 2, 10], [6, 8, 6], [7, 9, 4], [1, 5, 4], [1, 0, 4], [9, 7, 3], [7, 0, 5], [6, 5, 8], [1, 7, 6], [4, 0, 9], [5, 9, 1], [8, 7, 3], [1, 2, 6], [4, 1, 5], [5, 2, 4], [1, 9, 1], [7, 8, 10], [0, 4, 2], [7, 2, 8]]
        let src = 6
        let dst = 0
        let k = 7
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, 14)
    }
    
    func test_E() {
        let n = 18
        let flights = [[16, 1, 81], [15, 13, 47], [1,0, 24], [5, 10, 21], [7, 1, 72], [0, 4, 88], [16, 4, 39], [9, 3, 25], [10, 11, 28], [13, 8, 93], [10, 3, 62], [14,0, 38], [3, 10, 58], [3, 12, 46], [3, 8, 2], [10, 16, 27], [6, 9, 90], [14, 8, 6], [0, 13, 31], [6, 4, 65], [14, 17, 29], [13, 17, 64], [12, 5, 26], [12, 1, 9], [12, 15, 79], [16, 11, 79], [16, 15, 17], [4,0, 21], [15, 10, 75], [3, 17, 23], [8, 5, 55], [9, 4, 19], [0, 10, 83], [3, 7, 17], [0, 12, 31], [11, 5, 34], [17, 14, 98], [11, 14, 85], [16, 7, 48], [12, 6, 86], [5, 17, 72], [4, 12, 5], [12, 10, 23], [3, 2, 31], [12, 7, 5], [6, 13, 30], [6, 7, 88], [2, 17, 88], [6, 8, 98], [0, 7, 69], [10, 15, 13], [16, 14, 24], [1, 17, 24], [13, 9, 82], [13, 6, 67], [15, 11, 72], [12,0, 83], [1, 4, 37], [12, 9, 36], [9, 17, 81], [9, 15, 62], [8, 15, 71], [10, 12, 25], [7, 6, 23], [16, 5, 76], [7, 17, 4], [3, 11, 82], [2, 11, 71], [8, 4, 11], [14, 10, 51], [8, 10, 51], [4, 1, 57], [6, 16, 68], [3, 9, 100], [1, 14, 26], [10, 7, 14], [8, 17, 24], [1, 11, 10], [2, 9, 85], [9, 6, 49], [11, 4, 95]]
        let src = 7
        let dst = 2
        let k = 6
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, 169)
    }
    
    func test_F() {
        let n = 3
        let flights = [[0, 1, 100], [1, 2, 100]]
        let src = 0
        let dst = 2
        let k = 0
        
        let cheapestFlight = CheapestFlightsWithinKStops.findCheapestPrice(n, flights, src, dst, k)
        
        XCTAssertEqual(cheapestFlight, -1)
    }
}
