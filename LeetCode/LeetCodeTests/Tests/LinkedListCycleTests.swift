//
//  LinkedListCycleTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LinkedListCycleTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let data = [3, 2, 0, -4]
        let pos = 1
        let head = ListNode.deserialize(data, pos)
        
        let containsCycle = LinkedListCycle.hasCycle(head)
        
        XCTAssertTrue(containsCycle)
    }
    
    func test_B() {
        let data = [1, 2]
        let pos = 0
        let head = ListNode.deserialize(data, pos)
        
        let containsCycle = LinkedListCycle.hasCycle(head)
        
        XCTAssertTrue(containsCycle)
    }
    
    func test_C() {
        let data = [1]
        let pos = -1
        let head = ListNode.deserialize(data, pos)
        
        let containsCycle = LinkedListCycle.hasCycle(head)
        
        XCTAssertFalse(containsCycle)
    }
}
