//
//  ConvertBSTToGreaterTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/11/2023.
//

import XCTest

@testable import LeetCode

final class ConvertBSTToGreaterTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [4,1,6,0,2,5,7,nil,nil,nil,3,nil,nil,nil,8]
        let root = TreeNode.deserialize(data)
        
        let result = ConvertBSTToGreaterTree().convertBST(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [30,36,21,36,35,26,15,nil,nil,nil,33,nil,nil,nil,8])
    }
    
    func test_B() {
        let data = [0,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = ConvertBSTToGreaterTree().convertBST(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,1])
    }
}
