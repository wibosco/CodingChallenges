// Created 15/05/2016.


import XCTest

@testable import HackerRank

final class RunningTimeTests: XCTestCase {
    
    func test_A() {
        let numberOfShifts = RunningTime.numberOfShiftsToSort(array: [2, 1, 3, 1, 2])
        
        XCTAssertEqual(4, numberOfShifts)
    }
    
}
