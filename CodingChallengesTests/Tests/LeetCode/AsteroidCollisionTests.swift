//
//  AsteroidCollisionTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class AsteroidCollisionTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let asteroids = [5, 10, -5]
        
        let outcome = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(outcome, [5, 10])
    }
    
    func test_B() {
        let asteroids = [8, -8]
        
        let outcome = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(outcome, [])
    }
    
    func test_C() {
        let asteroids = [10, 2, -5]
        
        let outcome = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(outcome, [10])
    }
}
