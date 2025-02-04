//
//  HouseRobberIIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/11/2023.
//

import XCTest

@testable import LeetCode

final class HouseRobberIIITests: XCTestCase {

   
    //MARK: - Tests
    
    func test_A() {
        let data = [3,2,3,nil,3,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = HouseRobberIII().rob(root)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_B() {
        let data = [3,4,5,1,3,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = HouseRobberIII().rob(root)
        
        XCTAssertEqual(result, 9)
    }
}
