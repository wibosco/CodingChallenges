//
//  RunningTimeTests.swift
//  CodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class RunningTimeTests: XCTestCase {
    
    func test_numberOfShiftsA() {
        
        let numberOfShifts = RunningTime.numberOfShiftsToSort(array: [2, 1, 3, 1, 2])
        
        XCTAssertEqual(4, numberOfShifts)
    }
    
}
