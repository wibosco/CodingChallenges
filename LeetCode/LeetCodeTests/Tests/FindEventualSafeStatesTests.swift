//
//  FindEventualSafeStatesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/07/2023.
//

import XCTest

@testable import LeetCode

final class FindEventualSafeStatesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let graph = [[1, 2], [2, 3], [5], [0], [5], [], []]
            
        let result = FindEventualSafeStates().eventualSafeNodes(graph)
        
        XCTAssertEqual(result, [2, 4, 5, 6])
    }
    
    func test_B() {
        let graph = [[1, 2, 3, 4], [1, 2], [3, 4], [0, 4], []]
            
        let result = FindEventualSafeStates().eventualSafeNodes(graph)
        
        XCTAssertEqual(result, [4])
    }
    
    func test_C() {
        let graph = [[], [0, 2, 3, 4], [3], [4], []]
            
        let result = FindEventualSafeStates().eventualSafeNodes(graph)
        
        XCTAssertEqual(result, [0, 1, 2, 3, 4])
    }
}
