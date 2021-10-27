//
//  AngryProfessorTests.swift
//  CodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class AngryProfessorTests: XCTestCase {
    
    // MARK: Tests
    
    func test_classCancelled() {
        
        let cancelled = AngryProfessor.shouldCancelClass(studentArrivalTimes: [-1, 5, 6, 8], cancellationThreshold: 2)
        
        XCTAssertTrue(cancelled)
    }
    
    func test_classNotCancelled() {
        
        let cancelled = AngryProfessor.shouldCancelClass(studentArrivalTimes: [-9, 3, -4, -8], cancellationThreshold: 2)
        
        XCTAssertFalse(cancelled)
    }
    
}
