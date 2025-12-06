// Created 14/01/2022.


import XCTest

@testable import LeetCode

final class CapacityToShipPackagesWithinDDaysTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let weights = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let days = 5
        
        let result = CapacityToShipPackagesWithinDDays().shipWithinDays(weights, days)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_B() {
        let weights = [3, 2, 2, 4, 1, 4]
        let days = 3
        
        let result = CapacityToShipPackagesWithinDDays().shipWithinDays(weights, days)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_C() {
        let weights = [1, 2, 3, 1, 1]
        let days = 4
        
        let result = CapacityToShipPackagesWithinDDays().shipWithinDays(weights, days)
        
        XCTAssertEqual(result, 3)
    }
}
