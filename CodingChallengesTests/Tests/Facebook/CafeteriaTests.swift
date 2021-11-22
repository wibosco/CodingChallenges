//
//  CafeteriaTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class CafeteriaTests: XCTestCase {

    // MARK: Tests
    
    func test_A() {
        let numOfSeats = 10
        let distancing = 1
        let currentDiners = 2
        let occupiedSeats = [2, 6]
        
        let additionalDiners = Cafeteria.maxAdditionalDinersCount(n: numOfSeats, k: distancing, m: currentDiners, s: occupiedSeats)
        
        XCTAssertEqual(additionalDiners, 3)
    }
    
    func test_B() {
        let numOfSeats = 15
        let distancing = 2
        let currentDiners = 3
        let occupiedSeats = [11, 6, 14]
        
        let additionalDiners = Cafeteria.maxAdditionalDinersCount(n: numOfSeats, k: distancing, m: currentDiners, s: occupiedSeats)
        
        XCTAssertEqual(additionalDiners, 1)
    }
}
