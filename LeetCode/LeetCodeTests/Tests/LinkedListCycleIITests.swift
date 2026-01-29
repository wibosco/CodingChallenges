// Created 19/01/2022.

import XCTest

@testable import LeetCode

final class LinkedListCycleIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 2, 0, -4]
        let pos = 1
        let head = ListNode.deserialize(data, pos)
        
        let result = LinkedListCycleII().detectCycle(head)
        
        XCTAssertEqual(result?.val, 2)
    }
    
    func test_B() {
        let data = [1, 2]
        let pos = 0
        let head = ListNode.deserialize(data, pos)
        
        let result = LinkedListCycleII().detectCycle(head)
        
        XCTAssertEqual(result?.val, 1)
    }
    
    func test_C() {
        let data = [1]
        let pos = -1
        let head = ListNode.deserialize(data, pos)
        
        let result = LinkedListCycleII().detectCycle(head)
        
        XCTAssertNil(result)
    }
}
