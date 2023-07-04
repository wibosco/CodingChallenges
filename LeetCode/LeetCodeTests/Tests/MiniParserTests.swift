//
//  MiniParserTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MiniParserTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "324"
        
        let ni = MiniParser.deserialize(s)
        
        let result = NestedInteger.serialize(ni)
        
        XCTAssertEqual(result, s)
    }
    
    func test_B() {
        let s = "[123,[456,[789]]]"
        
        let ni = MiniParser.deserialize(s)
        
        let result = NestedInteger.serialize(ni)
        
        XCTAssertEqual(result, s)
    }
}
