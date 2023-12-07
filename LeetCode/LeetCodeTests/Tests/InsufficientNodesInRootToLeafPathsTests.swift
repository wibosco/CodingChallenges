//
//  InsufficientNodesInRootToLeafPathsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/12/2023.
//

import XCTest

@testable import LeetCode

final class InsufficientNodesInRootToLeafPathsTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let limit = 1
        let data = [1,2,3,4,-99,-99,7,8,9,-99,-99,12,13,-99,14]
        let root = TreeNode.deserialize(data)
        
        let result = InsufficientNodesInRootToLeafPaths.sufficientSubset(root, limit)
        
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,2,3,4,nil,nil,7,8,9,nil,14])
    }
    
    func test_B() {
        let limit = 22
        let data = [5,4,8,11,nil,17,4,7,1,nil,nil,5,3]
        let root = TreeNode.deserialize(data)
        
        let result = InsufficientNodesInRootToLeafPaths.sufficientSubset(root, limit)
        
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [5,4,8,11,nil,17,4,7,nil,nil,nil,5])
    }
    
    func test_C() {
        let limit = -1
        let data = [1,2,-3,-5,nil,4,nil]
        let root = TreeNode.deserialize(data)
        
        let result = InsufficientNodesInRootToLeafPaths.sufficientSubset(root, limit)
        
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,-3,4])
    }
}
