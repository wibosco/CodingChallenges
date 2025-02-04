//
//  ATwoSumBSTsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/12/2023.
//

import XCTest

@testable import LeetCode

final class TwoSumBSTsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let target = 5
        let data1 = [2,1,4]
        let root1 = TreeNode.deserialize(data1)
        let data2 = [1,0,3]
        let root2 = TreeNode.deserialize(data2)
        
        let result = TwoSumBSTs().twoSumBSTs(root1, root2, target)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let target = 18
        let data1 = [0,-10,10]
        let root1 = TreeNode.deserialize(data1)
        let data2 = [5,1,7,0,2]
        let root2 = TreeNode.deserialize(data2)
        
        let result = TwoSumBSTs().twoSumBSTs(root1, root2, target)
        
        XCTAssertFalse(result)
    }
}
