//
//  DestroyingAsteroidsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class DestroyingAsteroidsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mass = 10
        let asteroids = [3, 9, 19, 5, 21]
        
        let destroyed = DestroyingAsteroids.asteroidsDestroyed(mass, asteroids)
        
        XCTAssertTrue(destroyed)
    }
    
    func test_B() {
        let mass = 5
        let asteroids = [4, 9, 23, 4]
        
        let destroyed = DestroyingAsteroids.asteroidsDestroyed(mass, asteroids)
        
        XCTAssertFalse(destroyed)
    }
    
    func test_C() {
        let mass = 1
        let asteroids = [1]
        
        let destroyed = DestroyingAsteroids.asteroidsDestroyed(mass, asteroids)
        
        XCTAssertTrue(destroyed)
    }
}
