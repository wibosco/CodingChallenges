//
//  RedundantConnectionTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/05/2023.
//

import XCTest

@testable import LeetCode

final class RedundantConnectionTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let edges = [[1, 2], [1, 3], [2, 3]]
            
        let result = RedundantConnection().findRedundantConnection(edges)
        
        XCTAssertEqual(result, [2, 3])
    }
    
    func test_B() {
        let edges = [[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]]
            
        let result = RedundantConnection().findRedundantConnection(edges)
        
        XCTAssertEqual(result, [1, 4])
    }
}
