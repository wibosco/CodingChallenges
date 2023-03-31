//
//  SortListTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SortListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [4, 2, 1, 3]
        let head = ListNode.deserialize(data)
        
        let sorted = SortList.sortList(head)
        
        let values = ListNode.serialize(sorted)
        
        XCTAssertEqual(values, [1, 2, 3, 4])
    }
    
    func test_B() {
        let data = [-1, 5, 3, 4, 0]
        let head = ListNode.deserialize(data)
        
        let sorted = SortList.sortList(head)
        
        let values = ListNode.serialize(sorted)
        
        XCTAssertEqual(values, [-1, 0, 3, 4, 5])
    }
    
    func test_C() {
        let data = [Int]()
        let head = ListNode.deserialize(data)
        
        let sorted = SortList.sortList(head)
        
        let values = ListNode.serialize(sorted)
        
        XCTAssertEqual(values, [Int]())
    }
}
