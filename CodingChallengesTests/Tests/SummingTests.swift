//
//  SummingTests.swift
//  CodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SummingTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_sum() {
        
        let sum = Summing.sum(array: [7, 8, 67, 5, 23, 9])
        
        XCTAssertEqual(119, sum, "Summing up has failed to produce the expected answer")
    }
    
    func test_sumLargeValues() {
        
        let sum = Summing.sumLargeValue(array: [1000000000000001, 1000000000000002, 1000000000000003, 1000000000000004, 1000000000000005])
        
        XCTAssertEqual(5000000000000015, sum, "Summing up has failed to produce the expected answer")
    }
    
    func test_sumMatrixDiagonals() {
        
        let row1 = [11, 2, 4]
        let row2 = [4, 5, 6]
        let row3 = [10, 8, -12]
        
        let matrix = [row1, row2, row3]
        
        let sum = Summing.sumMatrixDiagonals(matrix: matrix)
        
        XCTAssertEqual(15, sum, "Summing up has failed to produce the expected answer")
        
    }
}
