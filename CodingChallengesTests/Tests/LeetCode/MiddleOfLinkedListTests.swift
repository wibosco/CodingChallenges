//
//  MiddleOfLinkedListTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MiddleOfLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let middle = MiddleOfLinkedList.middleNode(head)
        
        let values = ListNode.serialize(middle)
        
        XCTAssertEqual(values, [3, 4, 5])
    }
    
    func test_B() {
        let data = [1, 2, 3, 4, 5, 6]
        let head = ListNode.deserialize(data)
        
        let middle = MiddleOfLinkedList.middleNode(head)
        
        let values = ListNode.serialize(middle)
        
        XCTAssertEqual(values, [4, 5, 6])
    }

}
