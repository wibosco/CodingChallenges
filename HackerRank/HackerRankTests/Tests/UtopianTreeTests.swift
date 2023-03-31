//
//  UtopianTreeTests.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class UtopianTreeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let height = UtopianTree.heightOfTree(cycles: 0)
        
        XCTAssertEqual(1, height)
    }
    
    func test_B() {
        let height = UtopianTree.heightOfTree(cycles: 1)
        
        XCTAssertEqual(2, height)
    }
    
    func test_C() {
        let height = UtopianTree.heightOfTree(cycles: 4)
        
        XCTAssertEqual(7, height)
    }
}
