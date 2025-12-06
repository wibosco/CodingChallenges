// Created 18/07/2023.


import XCTest

@testable import LeetCode

final class BoatsToSavePeopleTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let people = [1, 2]
        let limit = 3
        
        let result = BoatsToSavePeople().numRescueBoats(people, limit)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let people = [3, 2, 2, 1]
        let limit = 3
        
        let result = BoatsToSavePeople().numRescueBoats(people, limit)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let people = [3, 5, 3, 4]
        let limit = 5
        
        let result = BoatsToSavePeople().numRescueBoats(people, limit)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let people = [5, 1, 4, 2]
        let limit = 6
        
        let result = BoatsToSavePeople().numRescueBoats(people, limit)
        
        XCTAssertEqual(result, 2)
    }
}
