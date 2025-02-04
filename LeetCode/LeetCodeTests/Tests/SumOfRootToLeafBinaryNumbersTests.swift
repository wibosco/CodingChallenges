//
//  SumOfRootToLeafBinaryNumbersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class SumOfRootToLeafBinaryNumbersTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,0,1,0,1,0,1]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfRootToLeafBinaryNumbers().sumRootToLeaf(root)
        
        XCTAssertEqual(result, 22)
    }
    
    func test_B() {
        let data = [0]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfRootToLeafBinaryNumbers().sumRootToLeaf(root)
        
        XCTAssertEqual(result, 0)
    }
}
