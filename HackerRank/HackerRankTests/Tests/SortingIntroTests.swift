// Created 15/05/2016.

import XCTest

@testable import HackerRank

final class SortingIntroTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let index = SortingIntro.indexOfValue(value: 4, array: [1, 4, 5, 7, 9, 12])
        
        XCTAssertEqual(1, index)
    }
}
