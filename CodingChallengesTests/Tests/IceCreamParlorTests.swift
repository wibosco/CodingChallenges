//
//  IceCreamParlorTests.swift
//  CodingChallenges
//
//  Created by William Boles on 11/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class IceCreamParlorTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let iceCreamChoices = [1,4,5,3,2]
        let money = 4
        
        let chosenIceCreams = IceCreamParlor.chosenIceCreams(money: money, iceCreamChoices: iceCreamChoices)
        
        XCTAssertEqual(0, chosenIceCreams.firstIceCream)
        XCTAssertEqual(3, chosenIceCreams.secondIceCream)
    }
    
    func test_B() {
        let iceCreamChoices = [2,2,4,3]
        let money = 4
        
        let chosenIceCreams = IceCreamParlor.chosenIceCreams(money: money, iceCreamChoices: iceCreamChoices)
        
        XCTAssertEqual(0, chosenIceCreams.firstIceCream)
        XCTAssertEqual(1, chosenIceCreams.secondIceCream)
    }
    
}
