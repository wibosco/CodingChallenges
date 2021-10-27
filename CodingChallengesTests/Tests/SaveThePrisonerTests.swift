//
//  SaveThePrisonerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SaveThePrisonerTests: XCTestCase {

    //MARK: - Tests
    
    func test_saveThePrisonerA() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 5, numberOfSweets: 2, startingPrisonerIndex: 1)
        
        XCTAssertEqual(poisonedPrisoner, 2)
    }
    
    func test_saveThePrisonerB() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 5, numberOfSweets: 2, startingPrisonerIndex: 2)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_saveThePrisonerC() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 7, numberOfSweets: 19, startingPrisonerIndex: 2)
        
        XCTAssertEqual(poisonedPrisoner, 6)
    }
    
    func test_saveThePrisonerD() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 3, numberOfSweets: 7, startingPrisonerIndex: 3)
        
        XCTAssertEqual(poisonedPrisoner, 3)
    }
    
    func test_saveThePrisonerE() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 352926151, numberOfSweets: 380324688, startingPrisonerIndex: 94730870)
        
        XCTAssertEqual(poisonedPrisoner, 122129406)
    }
    
    func test_saveThePrisonerF() {
        let poisonedPrisoner = SaveThePrisoner.poisonedPrisoner(numberOfPrisoners: 94431605, numberOfSweets: 679262176, startingPrisonerIndex: 5284458)
        
        XCTAssertEqual(poisonedPrisoner, 23525398)
    }
}
