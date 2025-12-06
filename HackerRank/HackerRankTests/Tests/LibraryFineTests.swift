// Created 10/05/2016.


import XCTest

@testable import HackerRank

final class LibraryFineTests: XCTestCase {
    
    // MARK: Test
    
    func test_A() {
        let fine = LibraryFine.calculateFine(dueDate: "9 6 2015", expectedDueDate: "6 6 2015")
        
        XCTAssertEqual(45, fine)
    }
    
    func test_B() {
        let fine = LibraryFine.calculateFine(dueDate: "2 7 1014", expectedDueDate: "1 1 1014")
        
        XCTAssertEqual(3000, fine)
    }
    
    func test_C() {
        let fine = LibraryFine.calculateFine(dueDate: "4 5 2014", expectedDueDate: "1 1 1015")
        
        XCTAssertEqual(10000, fine)
    }
    
}
