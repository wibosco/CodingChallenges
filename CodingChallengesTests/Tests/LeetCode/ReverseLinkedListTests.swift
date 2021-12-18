//
//  ReverseLinkedListTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ReverseLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let reversedHead = ReverseLinkedList.reverseList(head)
        
        let values = ListNode.extractValues(fromList: reversedHead)
        
        XCTAssertEqual(values, [5, 4, 3, 2, 1])
    }
    
    func test_B() {
        let data = [1, 2]
        let head = ListNode.deserialize(data)
        
        let reversedHead = ReverseLinkedList.reverseList(head)
        
        let values = ListNode.extractValues(fromList: reversedHead)
        
        XCTAssertEqual(values, [2, 1])
    }
    
    func test_C() {
        let data = [Int]()
        let head = ListNode.deserialize(data)
        
        let reversedHead = ReverseLinkedList.reverseList(head)
        
        let values = ListNode.extractValues(fromList: reversedHead)
        
        XCTAssertEqual(values, [])
    }
}
