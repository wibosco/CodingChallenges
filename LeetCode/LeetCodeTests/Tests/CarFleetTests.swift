//
//  CarFleetTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/05/2023.
//

import XCTest

@testable import LeetCode

final class CarFleetTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let target = 12
        let position = [10, 8, 0, 5, 3]
        let speed = [2, 4, 1, 1, 3]
        
        let result = CarFleet.carFleet(target, position, speed)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let target = 10
        let position = [0, 2, 4]
        let speed = [4, 2, 1]
        
        let result = CarFleet.carFleet(target, position, speed)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let target = 100
        let position = [0, 2, 4]
        let speed = [4, 2, 1]
        
        let result = CarFleet.carFleet(target, position, speed)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let target = 10
        let position = [6, 8]
        let speed = [3, 2]
        
        let result = CarFleet.carFleet(target, position, speed)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let target = 10
        let position = [0, 4, 2]
        let speed = [2, 1, 3]
        
        let result = CarFleet.carFleet(target, position, speed)
        
        XCTAssertEqual(result, 1)
    }
}
