//
//  BattleshipTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BattleshipTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let rows = 2
        let columns = 3
        let grid = [[0, 0, 1], [1, 0, 1]]
        
        let probability = Battleship.hitProbability(r: rows, c: columns, g: grid)
        
        XCTAssertEqual(probability, 0.5, accuracy: 0.000001)
    }
    
    func test_B() {
        let rows = 2
        let columns = 2
        let grid = [[1, 1], [1, 1]]
        
        let probability = Battleship.hitProbability(r: rows, c: columns, g: grid)
        
        XCTAssertEqual(probability, 1, accuracy: 0.000001)
    }
}
