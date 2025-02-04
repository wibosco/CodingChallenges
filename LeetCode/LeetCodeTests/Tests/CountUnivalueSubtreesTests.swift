//
//  CountUnivalueSubtreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CountUnivalueSubtreesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [5, 1, 5, 5, 5, nil, 5]
        
        let root = TreeNode.deserialize(data)
        
        let result = CountUnivalueSubtrees().countUnivalSubtrees(root)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let data = [Int]()
        
        let root = TreeNode.deserialize(data)
        
        let result = CountUnivalueSubtrees().countUnivalSubtrees(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let data = [5, 5, 5, 5, 5, nil, 5]
        
        let root = TreeNode.deserialize(data)
        
        let result = CountUnivalueSubtrees().countUnivalSubtrees(root)
        
        XCTAssertEqual(result, 6)
    }
}
