// Created 27/10/2021.


import XCTest

@testable import HackerRank

final class SaveThePrisonerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(5, 2, 1)
        
        XCTAssertEqual(poisonedPrisoner, 2)
    }
    
    func test_B() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(5, 2, 2)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_C() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(7, 19, 2)
        
        XCTAssertEqual(poisonedPrisoner, 6)
    }
    
    func test_D() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(3, 7, 3)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_E() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(352926151, 380324688, 94730870)
        
        XCTAssertEqual(poisonedPrisoner, 122129406)
    }
    
    func test_F() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(94431605, 679262176, 5284458)
        
        XCTAssertEqual(poisonedPrisoner, 23525398)
    }
}
