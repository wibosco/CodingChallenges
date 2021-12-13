//
//  OpenTheLockTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 13/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class OpenTheLockTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let deadends = ["0201",
                        "0101",
                        "0102",
                        "1212",
                        "2002"]
        let target = "0202"
        
        let rotations = OpenTheLock.openLock(deadends, target)
        
        XCTAssertEqual(rotations, 6)
    }
    
    func test_B() {
        let deadends = ["8888"]
        let target = "0009"
        
        let rotations = OpenTheLock.openLock(deadends, target)
        
        XCTAssertEqual(rotations, 1)
    }
    
    func test_C() {
        let deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"]
        let target = "8888"
        
        let rotations = OpenTheLock.openLock(deadends, target)
        
        XCTAssertEqual(rotations, -1)
    }
    
    func test_D() {
        let deadends = ["0000"]
        let target = "8888"
        
        let rotations = OpenTheLock.openLock(deadends, target)
        
        XCTAssertEqual(rotations, -1)
    }
}
