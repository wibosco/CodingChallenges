//
//  LisasWorkbookTests.swift
//  CodingChallenges
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class LisasWorkbookTests: XCTestCase {
    
    // MARK: Tests
    
    func test_specialProblemsA() {
    
        let specialProblems = LisasWorkbook.specialProblemsInBook(problemsPerChapter: [4, 2, 6, 1, 10], problemsPerPage: 3)
        
        XCTAssertEqual(4, specialProblems)
    }
    
    func test_specialProblemsB() {
        
        let specialProblems = LisasWorkbook.specialProblemsInBook(problemsPerChapter: [1, 8, 19, 15, 2, 29, 3, 2, 25, 2, 19, 26, 17, 33, 22], problemsPerPage: 20)
        
        XCTAssertEqual(11, specialProblems)
    }
    
    // MARK: AltTests
    
    func test_specialProblemsAltA() {
        
        let specialProblems = LisasWorkbook.specialProblemsInBookAlt(problemsPerChapter: [4, 2, 6, 1, 10], problemsPerPage: 3)
        
        XCTAssertEqual(4, specialProblems)
    }
    
    func test_specialProblemsAltB() {
        
        let specialProblems = LisasWorkbook.specialProblemsInBookAlt(problemsPerChapter: [1, 8, 19, 15, 2, 29, 3, 2, 25, 2, 19, 26, 17, 33, 22], problemsPerPage: 20)
        
        XCTAssertEqual(11, specialProblems)
    }
    
}
