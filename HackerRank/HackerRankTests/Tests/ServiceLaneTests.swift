// Created 08/05/2016.

import XCTest

@testable import HackerRank

final class ServiceLaneTests: XCTestCase {
    
    // MARK: Accessors
    
    let serviceLane = [2, 3, 1, 2, 3, 2, 3, 3]
    
    // MARK: Test
    
    func test_A() {
        let result = ServiceLane.largestVehicle(servicelane: self.serviceLane, entrance: 0, exit: 3)
        
        XCTAssertEqual(1, result)
    }
    
    func test_B() {
        let result = ServiceLane.largestVehicle(servicelane: self.serviceLane, entrance: 4, exit: 6)
        
        XCTAssertEqual(2, result)
    }
    
    func test_C() {
        let result = ServiceLane.largestVehicle(servicelane: self.serviceLane, entrance: 6, exit: 7)
        
        XCTAssertEqual(3, result)
    }
    
    func test_D() {
        let result = ServiceLane.largestVehicle(servicelane: self.serviceLane, entrance: 3, exit: 5)
        
        XCTAssertEqual(2, result)
    }
    
    func test_E() {
        let result = ServiceLane.largestVehicle(servicelane: self.serviceLane, entrance: 0, exit: 7)
        
        XCTAssertEqual(1, result)
    }
}
