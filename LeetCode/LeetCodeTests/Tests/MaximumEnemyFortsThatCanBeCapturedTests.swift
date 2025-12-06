// Created 03/09/2024.


import XCTest

@testable import LeetCode

final class MaximumEnemyFortsThatCanBeCapturedTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let forts = [1,0,0,-1,0,0,0,0,1]
        
        let result = MaximumEnemyFortsThatCanBeCaptured().captureForts(forts)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let forts = [0,0,1,-1]
        
        let result = MaximumEnemyFortsThatCanBeCaptured().captureForts(forts)
        
        XCTAssertEqual(result, 0)
    }
}
