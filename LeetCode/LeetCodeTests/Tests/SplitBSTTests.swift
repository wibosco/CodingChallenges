//
//  SplitBSTTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/11/2023.
//

import XCTest

@testable import LeetCode

final class SplitBSTTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let target = 2
        let data = [4,2,6,1,3,5,7]
        let root = TreeNode.deserialize(data)
        
        let result = SplitBST().splitBST(root, target)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedResult: Set<[Int?]> = Set([[2,1],
                                               [4,3,6,nil,nil,5,7]])
        
        XCTAssertEqual(values.count, expectedResult.count)
        
        //order isn't important
        for value in values {
            XCTAssertTrue(expectedResult.contains(value))
        }
    }
    
    func test_B() {
        let target = 1
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = SplitBST().splitBST(root, target)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedResult: Set<[Int?]> = Set([[1],
                                               [Int]()])
        
        XCTAssertEqual(values.count, expectedResult.count)
        
        //order isn't important
        for value in values {
            XCTAssertTrue(expectedResult.contains(value))
        }
    }
    
    func test_C() {
        let target = 1
        let data = [1, nil, 2]
        let root = TreeNode.deserialize(data)
        
        let result = SplitBST().splitBST(root, target)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedResult: Set<[Int?]> = Set([[1],
                                               [2]])
        
        XCTAssertEqual(values.count, expectedResult.count)
        
        //order isn't important
        for value in values {
            XCTAssertTrue(expectedResult.contains(value))
        }
    }
    
    func test_D() {
        let target = 1
        let data = [10, 9, 12]
        let root = TreeNode.deserialize(data)
        
        let result = SplitBST().splitBST(root, target)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedResult: Set<[Int?]> = Set([[10, 9, 12],
                                               [Int]()])
        
        XCTAssertEqual(values.count, expectedResult.count)
        
        //order isn't important
        for value in values {
            XCTAssertTrue(expectedResult.contains(value))
        }
    }
    
    func test_E() {
        let target = 6
        let data = [10,5,20,3,9,15,25,nil,nil,8,nil,nil,nil,nil,nil,6,nil,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = SplitBST().splitBST(root, target)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedResult: Set<[Int?]> = Set([[5,3,6],
                                               [10,9,20,8,nil,15,25,7]])
        
        XCTAssertEqual(values.count, expectedResult.count)
        
        //order isn't important
        for value in values {
            XCTAssertTrue(expectedResult.contains(value))
        }
    }
}
