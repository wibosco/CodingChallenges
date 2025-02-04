//
//  DetonateTheMaximumBombsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/11/2023.
//

import XCTest

@testable import LeetCode

final class DetonateTheMaximumBombsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let bombs = [[2,1,3],
                     [6,1,4]]
        
        let result = DetonateTheMaximumBombs().maximumDetonation(bombs)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let bombs = [[1,1,5],
                     [10,10,5]]
        
        let result = DetonateTheMaximumBombs().maximumDetonation(bombs)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let bombs = [[1,2,3],
                     [2,3,1],
                     [3,4,2],
                     [4,5,3],
                     [5,6,4]]
        
        let result = DetonateTheMaximumBombs().maximumDetonation(bombs)
        
        XCTAssertEqual(result, 5)
    }
}
