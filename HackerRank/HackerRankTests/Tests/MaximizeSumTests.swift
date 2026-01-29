// Created 11/07/2016.

import XCTest

@testable import HackerRank

final class MaximizeSumTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let values = [3, 3, 9, 9, 5]
        let modulo = 7
        
        let maximum = MaximizeSum.maximizeSum(values: values, modulo: modulo)
        
        XCTAssertEqual(maximum, 6)
    }
    
}
