//
//  MaximumAverageSubtreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/12/2023.
//

import XCTest

@testable import LeetCode

final class MaximumAverageSubtreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,6,1]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumAverageSubtree().maximumAverageSubtree(root)
        
        XCTAssertEqual(result, 6.0, accuracy: 0.00001)
    }
    
    func test_B() {
        let data = [0,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumAverageSubtree().maximumAverageSubtree(root)
        
        XCTAssertEqual(result, 1.0, accuracy: 0.00001)
    }
}
