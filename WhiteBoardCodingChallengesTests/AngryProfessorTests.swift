//
//  AngryProfessorTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class AngryProfessorTests: XCTestCase {
    
    // MARK: Tests
    
    func test_classCancelled() {
        
        let cancelled = AngryProfessor.shouldCancelClass([-1, 5, 6, 8], cancellationThreshold: 2)
        
        XCTAssertTrue(cancelled)
    }
    
    func test_classNotCancelled() {
        
        let cancelled = AngryProfessor.shouldCancelClass([-9, 3, -4, -8], cancellationThreshold: 2)
        
        XCTAssertFalse(cancelled)
    }
    
}
