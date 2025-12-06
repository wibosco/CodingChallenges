// Created 05/09/2024.


import XCTest

@testable import LeetCode

final class HeatersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let houses = [1,2,3]
        let heaters = [2]
        
        let result = Heaters().findRadius(houses, heaters)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let houses = [1,2,3,4]
        let heaters = [1,4]
        
        let result = Heaters().findRadius(houses, heaters)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let houses = [1,5]
        let heaters = [2]
        
        let result = Heaters().findRadius(houses, heaters)
        
        XCTAssertEqual(result, 3)
    }
}
