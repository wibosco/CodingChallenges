//
//  MinimumAbsoluteDifferenceInBSTTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/11/2023.
//

import XCTest

@testable import LeetCode

final class MinimumAbsoluteDifferenceInBSTTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [4,2,6,1,3]
        let root = TreeNode.deserialize(data)
        
        let result = MinimumAbsoluteDifferenceInBST().getMinimumDifference(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let data = [1,0,48,nil,nil,12,49]
        let root = TreeNode.deserialize(data)
        
        let result = MinimumAbsoluteDifferenceInBST().getMinimumDifference(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let data = [236,104,701,nil,227,nil,911]
        let root = TreeNode.deserialize(data)
        
        let result = MinimumAbsoluteDifferenceInBST().getMinimumDifference(root)
        
        XCTAssertEqual(result, 9)
    }
}
