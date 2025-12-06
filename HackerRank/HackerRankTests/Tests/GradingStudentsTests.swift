// Created 27/10/2021.


import XCTest

@testable import HackerRank

final class GradingStudentsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let grades = [64, 29, 57]
        
        let roundedGrades = GradingStudents.roundGrades(grades)
        
        XCTAssertEqual(roundedGrades, [65, 29, 57])
    }
    
    func test_B() {
        let grades = [73, 67, 38, 33]
        
        let roundedGrades = GradingStudents.roundGrades(grades)
        
        XCTAssertEqual(roundedGrades, [75, 67, 40, 33])
    }
}
