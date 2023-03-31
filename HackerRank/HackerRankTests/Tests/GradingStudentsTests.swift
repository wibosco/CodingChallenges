//
//  GradingStudentsTests.swift
//  HackerRankTests
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

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
