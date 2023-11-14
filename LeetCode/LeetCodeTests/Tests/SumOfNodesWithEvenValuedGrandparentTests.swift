//
//  SumOfNodesWithEvenValuedGrandparentTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/11/2023.
//

import XCTest

@testable import LeetCode

final class SumOfNodesWithEvenValuedGrandparentTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [6,7,8,2,7,1,3,9,nil,1,4,nil,nil,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfNodesWithEvenValuedGrandparent.sumEvenGrandparent(root)
        
        XCTAssertEqual(result, 18)
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = SumOfNodesWithEvenValuedGrandparent.sumEvenGrandparent(root)
        
        XCTAssertEqual(result, 0)
    }
}
