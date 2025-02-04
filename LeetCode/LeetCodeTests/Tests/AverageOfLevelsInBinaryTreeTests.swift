//
//  AverageOfLevelsInBinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class AverageOfLevelsInBinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3,9,20,nil,nil,15,7]
        let root = TreeNode.deserialize(data)
        
        let result = AverageOfLevelsInBinaryTree().averageOfLevels(root)
        
        let expectedResult = [3.00000,14.50000,11.00000]
        
        guard result.count == expectedResult.count else {
            XCTFail()
            return
        }
        
        for i in 0..<result.count {
            XCTAssertEqual(result[i], expectedResult[i], accuracy: 0.00001)
        }
    }
    
    func test_B() {
        let data = [3,9,20,15,7]
        let root = TreeNode.deserialize(data)
        
        let result = AverageOfLevelsInBinaryTree().averageOfLevels(root)
        
        let expectedResult = [3.00000,14.50000,11.00000]
        
        guard result.count == expectedResult.count else {
            XCTFail()
            return
        }
        
        for i in 0..<result.count {
            XCTAssertEqual(result[i], expectedResult[i], accuracy: 0.00001)
        }
    }
}
