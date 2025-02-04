//
//  CountNodesEqualToAverageOfSubtreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class CountNodesEqualToAverageOfSubtreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [4,8,5,0,1,nil,6]
        let root = TreeNode.deserialize(data)
        
        let result = CountNodesEqualToAverageOfSubtree().averageOfSubtree(root)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = CountNodesEqualToAverageOfSubtree().averageOfSubtree(root)
        
        XCTAssertEqual(result, 1)
    }
}
