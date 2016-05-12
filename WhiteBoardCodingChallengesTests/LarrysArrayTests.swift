//
//  LarrysArrayTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class LarrysArrayTests: XCTestCase {
    
    // MARK: Tests
    
    func test_larrysArrayA() {
    
        let canBeSorted = LarrysArray.canRobotSort([3, 1, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayB() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayC() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 2, 3, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayD() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayE() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 2, 3, 5, 42])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayF() {
        
        let canBeSorted = LarrysArray.canRobotSort([4, 1, 3, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayG() {
        
        let canBeSorted = LarrysArray.canRobotSort([9, 6, 8, 12, 3, 7, 1, 11, 10, 2, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayH() {
        
        let canBeSorted = LarrysArray.canRobotSort([17, 21, 2, 1, 16, 9, 12, 11, 6, 18, 20, 7, 14, 8, 19, 10, 3, 4, 13, 5, 15])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayI() {
        
        let canBeSorted = LarrysArray.canRobotSort([5, 8, 13, 3, 10, 4, 12, 1, 2, 7, 14, 6, 15, 11, 9])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayJ() {
        
        let canBeSorted = LarrysArray.canRobotSort([8, 10, 6, 11, 7, 1, 9, 12, 3, 5, 13, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayK() {
        
        let canBeSorted = LarrysArray.canRobotSort([7, 9, 15, 8, 10, 16, 6, 14, 5, 13, 17, 12, 3, 11, 4, 1, 18, 2])
        
        XCTAssertFalse(canBeSorted)
    }
    
}
