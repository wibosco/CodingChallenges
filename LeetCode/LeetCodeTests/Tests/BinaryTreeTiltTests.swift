//
//  BinaryTreeTiltTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class BinaryTreeTiltTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeTilt.findTilt(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let data = [4,2,9,3,5,nil,7]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeTilt.findTilt(root)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_C() {
        let data = [21,7,14,1,1,2,2,3,3]
        let root = BinaryTreeNode.deserialize(data)
        
        let result = BinaryTreeTilt.findTilt(root)
        
        XCTAssertEqual(result, 9)
    }
}
