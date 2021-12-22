//
//  MergeTwoSortedListsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 10/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MergeTwoSortedListsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let l1 = ListNode.deserialize([1, 2, 4])
        let l2 = ListNode.deserialize([1, 3, 4])
        
        let mergedList = MergeTwoSortedLists.mergeTwoLists(l1, l2)
        let values = ListNode.serialize(mergedList)
        
        XCTAssertEqual(values, [1, 1, 2, 3, 4, 4])
    }
    
    func test_B() {
        let l1 = ListNode.deserialize([])
        let l2 = ListNode.deserialize([])
        
        let mergedList = MergeTwoSortedLists.mergeTwoLists(l1, l2)
        let values = ListNode.serialize(mergedList)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let l1 = ListNode.deserialize([])
        let l2 = ListNode.deserialize([0])
        
        let mergedList = MergeTwoSortedLists.mergeTwoLists(l1, l2)
        let values = ListNode.serialize(mergedList)
        
        XCTAssertEqual(values, [0])
    }
}
