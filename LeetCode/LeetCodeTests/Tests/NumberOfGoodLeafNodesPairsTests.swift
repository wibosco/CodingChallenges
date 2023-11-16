//
//  NumberOfGoodLeafNodesPairsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/11/2023.
//

import XCTest

@testable import LeetCode

final class NumberOfGoodLeafNodesPairsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let distance = 3
        let data = [1,2,3,nil,4]
        let root = TreeNode.deserialize(data)
        
        let result = NumberOfGoodLeafNodesPairs.countPairs(root, distance)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let distance = 3
        let data = [1,2,3,4,5,6,7]
        let root = TreeNode.deserialize(data)
        
        let result = NumberOfGoodLeafNodesPairs.countPairs(root, distance)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let distance = 3
        let data = [7,1,4,6,nil,5,3,nil,nil,nil,nil,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = NumberOfGoodLeafNodesPairs.countPairs(root, distance)
        
        XCTAssertEqual(result, 1)
    }
}
