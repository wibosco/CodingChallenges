//
//  LarrysArrayTests.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

class LarrysArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let values = [3, 1, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_B() {
        let values = [1, 3, 4, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_C() {
        let values = [1, 2, 3, 5, 4]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_D() {
        let values = [1, 3, 4, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_E() {
        let values = [1, 2, 3, 5, 4]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_F() {
        let values = [4, 1, 3, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_G() {
        let values = [9, 6, 8, 12, 3, 7, 1, 11, 10, 2, 5, 4]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_H() {
        let values = [17, 21, 2, 1, 16, 9, 12, 11, 6, 18, 20, 7, 14, 8, 19, 10, 3, 4, 13, 5, 15]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_I() {
        let values = [5, 8, 13, 3, 10, 4, 12, 1, 2, 7, 14, 6, 15, 11, 9]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_J() {
        let values = [8, 10, 6, 11, 7, 1, 9, 12, 3, 5, 13, 4, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_K() {
        let values = [7, 9, 15, 8, 10, 16, 6, 14, 5, 13, 17, 12, 3, 11, 4, 1, 18, 2]
        let canBeSorted = LarrysArray.canRobotSort(values: values)
        
        XCTAssertFalse(canBeSorted)
    }
}
