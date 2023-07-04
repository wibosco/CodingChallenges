//
//  AsteroidCollisionTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class AsteroidCollisionTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let asteroids = [5, 10, -5]
        
        let result = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(result, [5, 10])
    }
    
    func test_B() {
        let asteroids = [8, -8]
        
        let result = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(result, [])
    }
    
    func test_C() {
        let asteroids = [10, 2, -5]
        
        let result = AsteroidCollision.asteroidCollision(asteroids)
        
        XCTAssertEqual(result, [10])
    }
}
