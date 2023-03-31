//
//  SimplifyPathTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SimplifyPathTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let path = "/home/"
        
        let simplifiedPath = SimplifyPath.simplifyPath(path)
        
        XCTAssertEqual(simplifiedPath, "/home")
    }
    
    func test_B() {
        let path = "/../"
        
        let simplifiedPath = SimplifyPath.simplifyPath(path)
        
        XCTAssertEqual(simplifiedPath, "/")
    }
    
    func test_C() {
        let path = "/home//foo/"
        
        let simplifiedPath = SimplifyPath.simplifyPath(path)
        
        XCTAssertEqual(simplifiedPath, "/home/foo")
    }
    
    func test_D() {
        let path = "/a/./b/../../c/"
        
        let simplifiedPath = SimplifyPath.simplifyPath(path)
        
        XCTAssertEqual(simplifiedPath, "/c")
    }
}
