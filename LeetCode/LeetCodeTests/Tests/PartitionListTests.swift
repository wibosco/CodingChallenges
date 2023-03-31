//
//  PartitionListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/03/2022.
//

import XCTest

@testable import LeetCode

final class PartitionListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 4, 3, 2, 5, 2]
        let list = ListNode.deserialize(data)
        
        let x = 3
        
        let partitionedList = PartitionList.partition(list, x)
        
        let values = ListNode.serialize(partitionedList)
        
        XCTAssertEqual(values, [1, 2, 2, 4, 3, 5])
    }
    
    func test_B() {
        let data = [2, 1]
        let list = ListNode.deserialize(data)
        
        let x = 2
        
        let partitionedList = PartitionList.partition(list, x)
        
        let values = ListNode.serialize(partitionedList)
        
        XCTAssertEqual(values, [1, 2])
    }
}
