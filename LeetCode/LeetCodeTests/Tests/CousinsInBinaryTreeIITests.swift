//
//  CousinsInBinaryTreeIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/11/2023.
//

import XCTest

@testable import LeetCode

final class CousinsInBinaryTreeIITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,4,9,1,10,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = CousinsInBinaryTreeII.replaceValueInTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [0,0,0,7,7,nil,11])
    }
    
    func test_B() {
        let data = [3,1,2]
        let root = TreeNode.deserialize(data)
        
        let result = CousinsInBinaryTreeII.replaceValueInTree(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [0,0,0])
    }
}
