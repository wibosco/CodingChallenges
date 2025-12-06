// Created 14/05/2016.


import XCTest

@testable import HackerRank

final class NewYearChaosTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [2, 1, 5, 3, 4])
        
        XCTAssertEqual(3, bribes)
    }
    
    func test_B() {
        
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [2, 5, 1, 3, 4])
        
        XCTAssertEqual(-1, bribes)
    }
    
    func test_C() {
        
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [2, 1, 4, 5, 6, 3, 7])
        
        XCTAssertEqual(4, bribes)
    }
    
    func test_D() {
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [2, 1, 4, 5, 6, 7, 3])
        
        XCTAssertEqual(5, bribes)
    }
    
    func test_E() {
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [5, 1, 2, 3, 7, 8, 6, 4])
        
        XCTAssertEqual(-1, bribes)
    }
    
    func test_F() {
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [1, 2, 5, 3, 7, 8, 6, 4])
        
        XCTAssertEqual(7, bribes)
    }
    
    func test_G() {
        let bribes = NewYearChaos.numberOfBribesToAchieveQueue(queue: [1, 2, 5, 3, 7, 8, 6, 4, 9])
        
        XCTAssertEqual(7, bribes)
    }
}
