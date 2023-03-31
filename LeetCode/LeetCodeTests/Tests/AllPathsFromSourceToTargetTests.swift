//
//  AllPathsFromSourceToTargetTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class AllPathsFromSourceToTargetTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let graph = [[1, 2],
                     [3],
                     [3],
                     []]
        
        let paths = AllPathsFromSourceToTarget.allPathsSourceTarget(graph)
        
        let expectedPaths = [[0, 1, 3], [0, 2, 3]]
        
        //order isn't important
        for path in paths {
            XCTAssertTrue(expectedPaths.contains(path))
        }
        
        XCTAssertEqual(paths.count, expectedPaths.count)
    }
    
    func test_B() {
        let graph = [[4, 3, 1],
                     [3, 2, 4],
                     [3],
                     [4],
                     []]
        
        let paths = AllPathsFromSourceToTarget.allPathsSourceTarget(graph)
        
        let expectedPaths = [[0, 4], [0, 3, 4], [0, 1, 3, 4], [0, 1, 2, 3, 4], [0, 1, 4]]
        
        //order isn't important
        for path in paths {
            XCTAssertTrue(expectedPaths.contains(path))
        }
        
        XCTAssertEqual(paths.count, expectedPaths.count)
    }
    
    func test_C() {
        let graph = [[1],
                     []]
        
        let paths = AllPathsFromSourceToTarget.allPathsSourceTarget(graph)
        
        XCTAssertEqual(paths, [[0, 1]])
    }
    
    func test_D() {
        let graph = [[1, 2, 3],
                     [2],
                     [3],
                     []]
        
        let paths = AllPathsFromSourceToTarget.allPathsSourceTarget(graph)
        
        let expectedPaths = [[0, 1, 2, 3], [0, 2, 3], [0, 3]]
        
        //order isn't important
        for path in paths {
            XCTAssertTrue(expectedPaths.contains(path))
        }
        
        XCTAssertEqual(paths.count, expectedPaths.count)
    }
    
    func test_E() {
        let graph = [[1, 3],
                     [2],
                     [3],
                     []]
        
        let paths = AllPathsFromSourceToTarget.allPathsSourceTarget(graph)
        
        let expectedPaths = [[0, 1, 2, 3], [0, 3]]
        
        //order isn't important
        for path in paths {
            XCTAssertTrue(expectedPaths.contains(path))
        }
        
        XCTAssertEqual(paths.count, expectedPaths.count)    }
}
