//
//  DeepestLeavesSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class DeepestLeavesSumTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3,4,5,nil,6,7,nil,nil,nil,nil,8]
        let root = TreeNode.deserialize(data)
        
        let result = DeepestLeavesSum.deepestLeavesSum(root)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_B() {
        let data = [6,7,8,2,7,1,3,9,nil,1,4,nil,nil,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = DeepestLeavesSum.deepestLeavesSum(root)
        
        XCTAssertEqual(result, 19)
    }
}
