//
//  ServiceLaneTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ServiceLaneTests: XCTestCase {
    
    // MARK: Accessors
    
    let serviceLane = [2, 3, 1, 2, 3, 2, 3, 3]
    
    // MARK: Test
    
    func test_serviceLaneEntrance0Exit3() {
        
        let largestVechile = ServiceLane.largestVechile(servicelane: self.serviceLane, entrance: 0, exit: 3)
        
        XCTAssertEqual(1, largestVechile)
    }
    
    func test_serviceLaneEntrance4Exit6() {
        
        let largestVechile = ServiceLane.largestVechile(servicelane: self.serviceLane, entrance: 4, exit: 6)
        
        XCTAssertEqual(2, largestVechile)
    }
    
    func test_serviceLaneEntrance6Exit7() {
        
        let largestVechile = ServiceLane.largestVechile(servicelane: self.serviceLane, entrance: 6, exit: 7)
        
        XCTAssertEqual(3, largestVechile)
    }
    
    func test_serviceLaneEntrance3Exit5() {
        
        let largestVechile = ServiceLane.largestVechile(servicelane: self.serviceLane, entrance: 3, exit: 5)
        
        XCTAssertEqual(2, largestVechile)
    }
    
    func test_serviceLaneEntrance0Exit7() {
        
        let largestVechile = ServiceLane.largestVechile(servicelane: self.serviceLane, entrance: 0, exit: 7)
        
        XCTAssertEqual(1, largestVechile)
    }
    
}
