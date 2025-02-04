//
//  SurroundedRegionsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/05/2023.
//

import XCTest

@testable import LeetCode

final class SurroundedRegionsTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        var board: [[Character]] = [["X","X","X","X"],
                                    ["X","O","O","X"],
                                    ["X","X","O","X"],
                                    ["X","O","X","X"]]
        
        SurroundedRegions().solve(&board)
        
        let expectedBoard: [[Character]] = [["X","X","X","X"],
                                            ["X","X","X","X"],
                                            ["X","X","X","X"],
                                            ["X","O","X","X"]]
        
        XCTAssertEqual(board, expectedBoard)
    }
    
    func test_B() {
        var board: [[Character]] = [["X"]]
        
        SurroundedRegions().solve(&board)
        
        let expectedBoard: [[Character]] = [["X"]]
        
        XCTAssertEqual(board, expectedBoard)
    }
}
