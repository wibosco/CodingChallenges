// Created 07/11/2023.

import XCTest

@testable import LeetCode

final class EliminateMaximumNumberOfMonstersTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let dist = [1,3,4]
        let speed = [1,1,1]
        
        let result = EliminateMaximumNumberOfMonsters().eliminateMaximum(dist, speed)
        
        XCTAssertEqual(result, 3)
    }

    func test_B() {
        let dist = [1,1,2,3]
        let speed = [1,1,1,1]
        
        let result = EliminateMaximumNumberOfMonsters().eliminateMaximum(dist, speed)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let dist = [3,2,4]
        let speed = [5,3,2]
        
        let result = EliminateMaximumNumberOfMonsters().eliminateMaximum(dist, speed)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let dist = [4,2,3]
        let speed = [2,1,1]
        
        let result = EliminateMaximumNumberOfMonsters().eliminateMaximum(dist, speed)
        
        XCTAssertEqual(result, 3)
    }
}
