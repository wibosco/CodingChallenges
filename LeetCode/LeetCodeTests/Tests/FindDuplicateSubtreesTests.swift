//
//  FindDuplicateSubtreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 19/11/2023.
//

import XCTest

@testable import LeetCode

final class FindDuplicateSubtreesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3,4,nil,2,4,nil,nil,4]
        let root = TreeNode.deserialize(data)
        
        let result = FindDuplicateSubtrees.findDuplicateSubtrees(root)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedValues: Set<[Int?]> = Set([[2,4],[4]])
        
        XCTAssertEqual(values.count, expectedValues.count)
        
        for value in values {
            XCTAssertTrue(expectedValues.contains(value))
        }
    }
    
    func test_B() {
        let data = [2,1,1]
        let root = TreeNode.deserialize(data)
        
        let result = FindDuplicateSubtrees.findDuplicateSubtrees(root)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedValues: Set<[Int?]> = Set([[1]])
        
        XCTAssertEqual(values.count, expectedValues.count)
        
        for value in values {
            XCTAssertTrue(expectedValues.contains(value))
        }
    }
    
    func test_C() {
        let data = [2,2,2,3,nil,3,nil]
        let root = TreeNode.deserialize(data)
        
        let result = FindDuplicateSubtrees.findDuplicateSubtrees(root)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedValues: Set<[Int?]> = Set([[2,3],[3]])
        
        XCTAssertEqual(values.count, expectedValues.count)
        
        for value in values {
            XCTAssertTrue(expectedValues.contains(value))
        }
    }
    
    func test_D() {
        let data = [0,0,0,0,nil,nil,0,nil,nil,nil,0]
        let root = TreeNode.deserialize(data)
        
        let result = FindDuplicateSubtrees.findDuplicateSubtrees(root)
        let values = result.map { TreeNode.serialize($0) }
        
        let expectedValues: Set<[Int?]> = Set([[0]])
        
        XCTAssertEqual(values.count, expectedValues.count)
        
        for value in values {
            XCTAssertTrue(expectedValues.contains(value))
        }
    }
}
