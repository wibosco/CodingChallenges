//
//  MakeCostsOfPathsEqualInABinaryTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/12/2023.
//

import XCTest

@testable import LeetCode

final class MakeCostsOfPathsEqualInABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 7
        let cost = [1,5,2,2,3,3,1]
            
        let result = MakeCostsOfPathsEqualInABinaryTree.minIncrements(n, cost)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let n = 3
        let cost = [5,3,3]
            
        let result = MakeCostsOfPathsEqualInABinaryTree.minIncrements(n, cost)
        
        XCTAssertEqual(result, 0)
    }
}
