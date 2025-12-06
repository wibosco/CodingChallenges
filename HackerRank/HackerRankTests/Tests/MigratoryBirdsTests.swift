// Created 29/10/2021.


import XCTest

@testable import HackerRank

final class MigratoryBirdsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let birds = [1, 1, 2, 2, 3]
        
        let mostFrequent = MigratoryBirds.mostFrequentBird(from: birds)
        
        XCTAssertEqual(1, mostFrequent)
    }
    
    func test_B() {
        let birds = [1, 4, 4, 4, 5, 3]
        
        let mostFrequent = MigratoryBirds.mostFrequentBird(from: birds)
        
        XCTAssertEqual(4, mostFrequent)
    }

    func test_C() {
        let birds = [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4]
        
        let mostFrequent = MigratoryBirds.mostFrequentBird(from: birds)
        
        XCTAssertEqual(3, mostFrequent)
    }
}
