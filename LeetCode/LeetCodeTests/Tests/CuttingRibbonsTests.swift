// Created 17/01/2022.


import XCTest

@testable import LeetCode

final class CuttingRibbonsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let ribbons = [9, 7, 5]
        let k = 3
        
        let result = CuttingRibbons().maxLength(ribbons, k)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let ribbons = [7, 5, 9]
        let k = 4
        
        let result = CuttingRibbons().maxLength(ribbons, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let ribbons = [5, 7, 9]
        let k = 22
        
        let result = CuttingRibbons().maxLength(ribbons, k)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let ribbons = [100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       1,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000,
                       100000]
        let k = 49
        
        let result = CuttingRibbons().maxLength(ribbons, k)
        
        XCTAssertEqual(result, 100000)
    }
}
