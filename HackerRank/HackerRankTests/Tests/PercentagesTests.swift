// Created 07/05/2016.


import XCTest

@testable import HackerRank

final class PercentagesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let percentages = Percentages.percentageOfUniqueSets(array: [-4, 3, -9, 0, 4, 1])
        
        XCTAssertEqual(0.500000, percentages.positivePercentage, accuracy: 0.000001)
        XCTAssertEqual(0.333333, percentages.negativePercentage, accuracy: 0.000001)
        XCTAssertEqual(0.166667, percentages.zeroPercentage, accuracy: 0.000001)
    }
    
}
