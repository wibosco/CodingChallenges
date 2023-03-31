//
//  SaveThePrisonerTests.swift
//  HackerRankTests
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class SaveThePrisonerTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 5, numberOfSweets: 2, startingPrisonerIndex: 1)
        
        XCTAssertEqual(poisonedPrisoner, 2)
    }
    
    func test_B() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 5, numberOfSweets: 2, startingPrisonerIndex: 2)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_C() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 7, numberOfSweets: 19, startingPrisonerIndex: 2)
        
        XCTAssertEqual(poisonedPrisoner, 6)
    }
    
    func test_D() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 3, numberOfSweets: 7, startingPrisonerIndex: 3)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_E() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 352926151, numberOfSweets: 380324688, startingPrisonerIndex: 94730870)
        
        XCTAssertEqual(poisonedPrisoner, 122129406)
    }
    
    func test_F() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 94431605, numberOfSweets: 679262176, startingPrisonerIndex: 5284458)
        
        XCTAssertEqual(poisonedPrisoner, 23525398)
    }
}
