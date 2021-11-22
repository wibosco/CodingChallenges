//
//  ChocolateFeastTests.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ChocolateFeastTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 10, chocolatePrice: 2, wrapperExchangeTheshold: 5)
        
        XCTAssertEqual(6, chocolatesEaten)
    }
    
    func test_B() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 12, chocolatePrice: 4, wrapperExchangeTheshold: 4)
        
        XCTAssertEqual(3, chocolatesEaten)
    }
    
    func test_C() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 6, chocolatePrice: 2, wrapperExchangeTheshold: 2)
        
        XCTAssertEqual(5, chocolatesEaten)
    }
    
    func test_D() {
        let chocolatesEaten = ChocolateFeast.countOfEatenChocolates(dollarsInPocket: 43203, chocolatePrice: 60, wrapperExchangeTheshold: 5)
        
        XCTAssertEqual(899, chocolatesEaten)
    }
}


