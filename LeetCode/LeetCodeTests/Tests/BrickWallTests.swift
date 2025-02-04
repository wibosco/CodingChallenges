//
//  BrickWallTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/07/2023.
//

import XCTest

@testable import LeetCode

final class BrickWallTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let wall = [[1, 2, 2, 1],
                    [3, 1, 2],
                    [1, 3, 2],
                    [2, 4],
                    [3, 1, 2],
                    [1, 3, 1, 1]]
        
        let result = BrickWall().leastBricks(wall)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let wall = [[1],
                    [1],
                    [1]]
        
        let result = BrickWall().leastBricks(wall)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let wall = [[100000000, 100000000],
                    [100000000, 100000000]]
        
        let result = BrickWall().leastBricks(wall)
        
        XCTAssertEqual(result, 0)
    }
}
