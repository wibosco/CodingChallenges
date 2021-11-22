//
//  ReorderListTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 21/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ReorderListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list = ListNode.createList(fromArray: [1, 2, 3, 4])
        
        ReorderList.reorderList(list)
        
        let values = ListNode.extractValues(fromList: list)
        
        XCTAssertEqual(values, [1, 4, 2, 3])
    }
    
    func test_B() {
        let list = ListNode.createList(fromArray: [1, 2, 3, 4, 5])
        
        ReorderList.reorderList(list)
        
        let values = ListNode.extractValues(fromList: list)
        
        XCTAssertEqual(values, [1, 5, 2, 4, 3])
    }
    
    func test_C() {
        let list = ListNode.createList(fromArray: [1, 2])
        
        ReorderList.reorderList(list)
        
        let values = ListNode.extractValues(fromList: list)
        
        XCTAssertEqual(values, [1, 2])
    }
}
