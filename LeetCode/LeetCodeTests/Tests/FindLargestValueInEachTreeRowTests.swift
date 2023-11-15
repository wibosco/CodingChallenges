//
//  FindLargestValueInEachTreeRowTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/11/2023.
//

import XCTest

@testable import LeetCode

final class FindLargestValueInEachTreeRowTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,3,2,5,3,nil,9]
        let root = TreeNode.deserialize(data)
        
        let result = FindLargestValueInEachTreeRow.largestValues(root)
        
        XCTAssertEqual(result, [1,3,9])
    }
    
    func test_B() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = FindLargestValueInEachTreeRow.largestValues(root)
        
        XCTAssertEqual(result, [1,3])
    }
}
