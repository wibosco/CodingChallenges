//
//  Matrix01Tests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class Matrix01Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let mat = [[0, 0, 0],
                   [0, 1, 0],
                   [0, 0, 0]]
        
        let distances = Matrix01.updateMatrix(mat)
        
        XCTAssertEqual(distances, [[0, 0, 0], [0, 1, 0], [0, 0, 0]])
    }
    
    func test_B() {
        let mat = [[0, 0, 0],
                   [0, 1, 0],
                   [1, 1, 1]]
        
        let distances = Matrix01.updateMatrix(mat)
        
        XCTAssertEqual(distances, [[0, 0, 0], [0, 1, 0], [1, 2, 1]])
    }
}
