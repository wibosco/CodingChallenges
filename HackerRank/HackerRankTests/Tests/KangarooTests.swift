// Created 28/10/2021.


import XCTest

@testable import HackerRank

final class KangarooTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let canSync = Kangaroo.canSyncJumps(x1: 0, v1: 3, x2: 4, v2: 2)
        
        XCTAssertTrue(canSync)
    }
    
    func test_B() {
        let canSync = Kangaroo.canSyncJumps(x1: 0, v1: 2, x2: 5, v2: 3)
        
        XCTAssertFalse(canSync)
    }
}
