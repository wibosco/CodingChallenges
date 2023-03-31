//
//  AngryProfessorTests.swift
//  HackerRankTests
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class AngryProfessorTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let cancelled = AngryProfessor.shouldCancelClass(studentArrivalTimes: [-1, 5, 6, 8], cancellationThreshold: 2)
        
        XCTAssertTrue(cancelled)
    }
    
    func test_B() {
        let cancelled = AngryProfessor.shouldCancelClass(studentArrivalTimes: [-9, 3, -4, -8], cancellationThreshold: 2)
        
        XCTAssertFalse(cancelled)
    }
}
