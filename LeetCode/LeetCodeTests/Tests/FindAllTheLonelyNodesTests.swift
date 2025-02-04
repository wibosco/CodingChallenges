//
//  FindAllTheLonelyNodesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/11/2023.
//

import XCTest

@testable import LeetCode

final class FindAllTheLonelyNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2,3,nil,4]
        let root = TreeNode.deserialize(data)
        
        let result = FindAllTheLonelyNodes().getLonelyNodes(root)
        
        let expectedResult = Set([4])
        
        XCTAssertEqual(result.count, expectedResult.count)
            
        //order not important
        for node in result {
            XCTAssertTrue(expectedResult.contains(node))
        }
    }
    
    func test_B() {
        let data = [7,1,4,6,nil,5,3,nil,nil,nil,nil,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = FindAllTheLonelyNodes().getLonelyNodes(root)
        
        let expectedResult = Set([6,2])
        
        XCTAssertEqual(result.count, expectedResult.count)
            
        //order not important
        for node in result {
            XCTAssertTrue(expectedResult.contains(node))
        }
    }
    
    func test_C() {
        let data = [11,99,88,77,nil,nil,66,55,nil,nil,44,33,nil,nil,22]
        let root = TreeNode.deserialize(data)
        
        let result = FindAllTheLonelyNodes().getLonelyNodes(root)
        
        let expectedResult = Set([77,55,33,66,44,22])
        
        XCTAssertEqual(result.count, expectedResult.count)
            
        //order not important
        for node in result {
            XCTAssertTrue(expectedResult.contains(node))
        }
    }
}
