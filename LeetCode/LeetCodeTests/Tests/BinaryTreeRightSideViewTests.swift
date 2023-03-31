//
//  BinaryTreeRightSideViewTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BinaryTreeRightSideViewTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, nil, 5, nil, 4]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let view = BinaryTreeRightSideView.rightSideView(root)
        
        XCTAssertEqual(view, [1, 3, 4])
    }
    
    func test_B() {
        let data = [1, nil, 3]
        
        let root = BinaryTreeNode.deserialize(data)
        
        let view = BinaryTreeRightSideView.rightSideView(root)
        
        XCTAssertEqual(view, [1, 3])
    }
    
    func test_C() {
        let data = [Int]()
        
        let root = BinaryTreeNode.deserialize(data)
        
        let view = BinaryTreeRightSideView.rightSideView(root)
        
        XCTAssertEqual(view, [])
    }

}
