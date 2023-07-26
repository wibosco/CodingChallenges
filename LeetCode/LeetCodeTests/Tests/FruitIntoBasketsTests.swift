//
//  FruitIntoBasketsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/07/2023.
//

import XCTest

@testable import LeetCode

final class FruitIntoBasketsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let fruits = [1, 2, 1]
        
        let result = FruitIntoBaskets.totalFruit(fruits)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let fruits = [0, 1, 2, 2]
        
        let result = FruitIntoBaskets.totalFruit(fruits)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let fruits = [1, 2, 3, 2, 2]
        
        let result = FruitIntoBaskets.totalFruit(fruits)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let fruits = [3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 4]
        
        let result = FruitIntoBaskets.totalFruit(fruits)
        
        XCTAssertEqual(result, 5)
    }
    
    
    func test_E() {
        let fruits = [0, 1, 1, 4, 3]
        
        let result = FruitIntoBaskets.totalFruit(fruits)
        
        XCTAssertEqual(result, 3)
    }
}
