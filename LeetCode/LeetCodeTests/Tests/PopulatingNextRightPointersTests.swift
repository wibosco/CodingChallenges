//
//  PopulatingNextRightPointersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PopulatingNextRightPointersTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5, 6, 7]
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointers().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, ["1", "#", "2", "3", "#", "4", "5", "6", "7", "#"])
    }
    
    func test_B() {
        let data = [Int]()
        let root = TreeNodeNext.deserialize(data)
        
        let node = PopulatingNextRightPointers().connect(root)
        
        let result = TreeNodeNext.serialize(node)
        
        XCTAssertEqual(result, [])
    }
}
