// Created 07/05/2016.


import XCTest

@testable import HackerRank

final class StaircaseTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let staircase = Staircase.staircase(height: 6)
        
        print(staircase)
        
        XCTAssertEqual("     #\n    ##\n   ###\n  ####\n #####\n######", staircase, "Staircasing not valid")
    }
}
