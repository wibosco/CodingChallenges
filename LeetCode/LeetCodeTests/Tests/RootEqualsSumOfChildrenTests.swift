//
//  RootEqualsSumOfChildrenTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/11/2023.
//

import XCTest

@testable import LeetCode

final class RootEqualsSumOfChildrenTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [10,4,6]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = RootEqualsSumOfChildren.checkTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [5,3,1]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = RootEqualsSumOfChildren.checkTree(root)
        
        XCTAssertFalse(result)
    }
}
