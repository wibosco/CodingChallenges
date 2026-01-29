// Created 11/07/2016.

import XCTest

@testable import HackerRank

final class IceCreamParlorTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let iceCreamChoices = [1, 4, 5, 3, 2]
        let money = 4
        
        let chosenIceCreams = IceCreamParlor.chosenIceCreams(money: money, iceCreamChoices: iceCreamChoices)
        
        XCTAssertEqual(0, chosenIceCreams.firstIceCream)
        XCTAssertEqual(3, chosenIceCreams.secondIceCream)
    }
    
    func test_B() {
        let iceCreamChoices = [2, 2, 4, 3]
        let money = 4
        
        let chosenIceCreams = IceCreamParlor.chosenIceCreams(money: money, iceCreamChoices: iceCreamChoices)
        
        XCTAssertEqual(0, chosenIceCreams.firstIceCream)
        XCTAssertEqual(1, chosenIceCreams.secondIceCream)
    }
    
}
