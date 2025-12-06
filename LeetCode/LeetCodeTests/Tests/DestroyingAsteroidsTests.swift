// Created 19/01/2022.


import XCTest

@testable import LeetCode

final class DestroyingAsteroidsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mass = 10
        let asteroids = [3, 9, 19, 5, 21]
        
        let result = DestroyingAsteroids().asteroidsDestroyed(mass, asteroids)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let mass = 5
        let asteroids = [4, 9, 23, 4]
        
        let result = DestroyingAsteroids().asteroidsDestroyed(mass, asteroids)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let mass = 1
        let asteroids = [1]
        
        let result = DestroyingAsteroids().asteroidsDestroyed(mass, asteroids)
        
        XCTAssertTrue(result)
    }
}
