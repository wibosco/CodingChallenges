// Created 22/03/2022.


import XCTest

@testable import LeetCode

final class ReverseLinkedListIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let list = ListNode.deserialize(data)
        
        let left = 2
        let right = 4
        
        let result = ReverseLinkedListII().reverseBetween(list, left, right)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 4, 3, 2, 5])
    }
    
    func test_B() {
        let data = [5]
        let list = ListNode.deserialize(data)
        
        let left = 1
        let right = 1
        
        let result = ReverseLinkedListII().reverseBetween(list, left, right)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [5])
    }
    
    func test_C() {
        let data = [5, 4]
        let list = ListNode.deserialize(data)
        
        let left = 1
        let right = 2
        
        let result = ReverseLinkedListII().reverseBetween(list, left, right)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [4, 5])
    }
    
    func test_D() {
        let data = [3, 5]
        let list = ListNode.deserialize(data)
        
        let left = 2
        let right = 2
        
        let result = ReverseLinkedListII().reverseBetween(list, left, right)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [3, 5])
    }
}
