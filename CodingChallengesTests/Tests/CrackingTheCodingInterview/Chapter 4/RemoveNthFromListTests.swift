//
//  RemoveNthFromListTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class RemoveNthFromListTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let head = ListNode.createList(fromArray: [1, 2, 3, 4, 5])
        let n = 2
        
        let returnedHead = RemoveNthFromList.removeNthFromEnd(head, n)
        let values = ListNode.extractValues(fromList: returnedHead)
        
        XCTAssertEqual(values, [1, 2, 3, 5])
    }
    
    func test_B() {
        let head = ListNode.createList(fromArray: [1])
        let n = 1
        
        let returnedHead = RemoveNthFromList.removeNthFromEnd(head, n)
        let values = ListNode.extractValues(fromList: returnedHead)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let head = ListNode.createList(fromArray: [1, 2])
        let n = 1
        
        let returnedHead = RemoveNthFromList.removeNthFromEnd(head, n)
        let values = ListNode.extractValues(fromList: returnedHead)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_D() {
        let head = ListNode.createList(fromArray: [1, 2])
        let n = 2
        
        let returnedHead = RemoveNthFromList.removeNthFromEnd(head, n)
        let values = ListNode.extractValues(fromList: returnedHead)
        
        XCTAssertEqual(values, [2])
    }
}
