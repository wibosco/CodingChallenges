// Created 03/09/2024.

import XCTest

@testable import LeetCode

final class FaultySensorTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let sensor1 = [2,3,4,5]
        let sensor2 = [2,1,3,4]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let sensor1 = [2,2,2,2,2]
        let sensor2 = [2,2,2,2,5]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let sensor1 = [2,3,2,2,3,2]
        let sensor2 = [2,3,2,3,2,7]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_D() {
        let sensor1 = [2,8,5,1,10,5,9,9,3,5]
        let sensor2 = [2,8,5,1,10,5,9,9,3,5]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_E() {
        let sensor1 = [94,83,6,37,34,6,33,39]
        let sensor2 = [94,83,6,37,34,6,88,33]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_F() {
        let sensor1 = [1,2,3,2,3,2]
        let sensor2 = [1,2,3,3,2,3]
            
        let result = FaultySensor().badSensor(sensor1, sensor2)
        
        XCTAssertEqual(result, -1)
    }
}
