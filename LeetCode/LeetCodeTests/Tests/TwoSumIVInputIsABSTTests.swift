//
//  TwoSumIVInputIsABSTTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class TwoSumIVInputIsABSTTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let k = 9
        let data = [5,3,6,2,4,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = TwoSumIVInputIsABST.findTarget(root, k)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let k = 28
        let data = [5,3,6,2,4,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = TwoSumIVInputIsABST.findTarget(root, k)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let k = 1
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = TwoSumIVInputIsABST.findTarget(root, k)
        
        XCTAssertFalse(result)
    }
}
