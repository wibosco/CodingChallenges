//
//  LongestUnivaluePathTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/11/2023.
//

import XCTest

@testable import LeetCode

final class LongestUnivaluePathTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,4,5,1,1,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = LongestUnivaluePath().longestUnivaluePath(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [1,4,5,4,4,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = LongestUnivaluePath().longestUnivaluePath(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let data = [Int]()
        let root = TreeNode.deserialize(data)
        
        let result = LongestUnivaluePath().longestUnivaluePath(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let data = [1,nil,1,1,1,1,1,1]
        let root = TreeNode.deserialize(data)
        
        let result = LongestUnivaluePath().longestUnivaluePath(root)
        
        XCTAssertEqual(result, 4)
    }
}
