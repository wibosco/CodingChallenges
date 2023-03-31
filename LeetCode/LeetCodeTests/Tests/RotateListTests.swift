//
//  RotateListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class RotateListTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let head = ListNode.deserialize([1, 2, 3, 4, 5])
        let k = 2
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [4, 5, 1, 2, 3])
    }
    
    func test_B() {
        let head = ListNode.deserialize([0, 1, 2])
        let k = 4
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [2, 0, 1])
    }
    
    func test_C() {
        let head = ListNode.deserialize([])
        let k = 0
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [])
    }
    
    func test_D() {
        let head = ListNode.deserialize([0, 1, 2])
        let k = 0
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [0, 1, 2])
    }
    
    func test_E() {
        let head = ListNode.deserialize([1])
        let k = 1
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_F() {
        let head = ListNode.deserialize([1, 2])
        let k = 2
        
        let returnedHead = RotateList.rotateRight(head, k)
        let values = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(values, [1, 2])
    }
}
