// Created 09/05/2016.


import XCTest

@testable import HackerRank

final class LisasWorkbookTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
    
        let specialProblems = LisasWorkbook.specialProblemsInBook([4, 2, 6, 1, 10],
                                                                  3)
        
        XCTAssertEqual(4, specialProblems)
    }
    
    func test_B() {
        
        let specialProblems = LisasWorkbook.specialProblemsInBook([1, 8, 19, 15, 2, 29, 3, 2, 25, 2, 19, 26, 17, 33, 22],
                                                                  20)
        
        XCTAssertEqual(11, specialProblems)
    }
}
