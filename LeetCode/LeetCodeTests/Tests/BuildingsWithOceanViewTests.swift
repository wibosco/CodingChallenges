// Created 12/01/2022.

import XCTest

@testable import LeetCode

final class BuildingsWithOceanViewTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let heights = [4, 2, 3, 1]
        
        let result = BuildingsWithOceanView().findBuildings(heights)
        
        XCTAssertEqual(result, [0, 2, 3]) // indexes
    }
    
    func test_B() {
        let heights = [4, 3, 2, 1]
        
        let result = BuildingsWithOceanView().findBuildings(heights)
        
        XCTAssertEqual(result, [0, 1, 2, 3]) // indexes
    }
    
    func test_C() {
        let heights = [1, 3, 2, 4]
        
        let result = BuildingsWithOceanView().findBuildings(heights)
        
        XCTAssertEqual(result, [3]) // indexes
    }
}
