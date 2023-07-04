//
//  DiameterOfNAryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class DiameterOfNAryTreeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, nil, 3, 2, 4, nil, 5, 6]
        
        let root = NaryTreeNode.deserialize(data)
        
        let result = DiameterOfNAryTree.diameter(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let data = [1, nil, 2, nil, 3, 4, nil, 5, nil, 6]
        
        let root = NaryTreeNode.deserialize(data)
        
        let result = DiameterOfNAryTree.diameter(root)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let data = [1, nil, 2, 3, 4, 5, nil, nil, 6, 7, nil, 8, nil, 9, 10, nil, nil, 11, nil, 12, nil, 13, nil, nil, 14]
        
        let root = NaryTreeNode.deserialize(data)
        
        let result = DiameterOfNAryTree.diameter(root)
        
        XCTAssertEqual(result, 7)
    }
}
