//
//  OrganizingContainersOfBallsTests.swift
//  HackerRankTests
//
//  Created by William Boles on 29/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class OrganizingContainersOfBallsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let ballsAndContainers = [[1, 1], [1, 1]]
        
        let possible = OrganizingContainersOfBalls.organizingContainers(containers: ballsAndContainers)
        
        XCTAssertTrue(possible)
    }
    
    func test_B() {
        let ballsAndContainers = [[1, 4], [2, 3]]
        
        let possible = OrganizingContainersOfBalls.organizingContainers(containers: ballsAndContainers)
        
        XCTAssertFalse(possible)
    }
    
    func test_C() {
        let ballsAndContainers = [[1, 3, 1], [2, 1, 2], [3, 3, 3]]
        
        let possible = OrganizingContainersOfBalls.organizingContainers(containers: ballsAndContainers)
        
        XCTAssertFalse(possible)
    }
    
    func test_D() {
        let ballsAndContainers = [[0, 2, 1], [1, 1, 1], [2, 0, 0]]
        
        let possible = OrganizingContainersOfBalls.organizingContainers(containers: ballsAndContainers)
        
        XCTAssertTrue(possible)
    }

}
