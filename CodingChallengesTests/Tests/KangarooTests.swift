//
//  KangarooTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class KangarooTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_canSyncJumpsA() {
        let canSync = Kangaroo.canSyncJumps(x1: 0, v1: 3, x2: 4, v2: 2)
        
        XCTAssertTrue(canSync)
    }
    
    func test_canSyncJumpsB() {
        let canSync = Kangaroo.canSyncJumps(x1: 0, v1: 2, x2: 5, v2: 3)
        
        XCTAssertFalse(canSync)
    }
}
