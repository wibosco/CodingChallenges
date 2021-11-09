//
//  AllWrongTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class AllWrongTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let count = 3
        let correctAnswers = "ABA"
        
        let wrongAnswers = AllWrong.wrongAnswers(n: count, c: correctAnswers)
        
        XCTAssertEqual(wrongAnswers, "BAB")
    }
    
    func test_B() {
        let count = 5
        let correctAnswers = "BBBBB"
        
        let wrongAnswers = AllWrong.wrongAnswers(n: count, c: correctAnswers)
        
        XCTAssertEqual(wrongAnswers, "AAAAA")
    }
}
