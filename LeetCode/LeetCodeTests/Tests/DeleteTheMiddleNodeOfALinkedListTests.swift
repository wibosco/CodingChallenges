// Created 09/05/2025.

import Testing

@testable import LeetCode

struct DeleteTheMiddleNodeOfALinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,3,4,7,1,2,6]
        let head = ListNode.deserialize(data)
        
        let result = DeleteTheMiddleNodeOfALinkedList().deleteMiddle(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,3,4,1,2,6])
    }
    
    @Test
    func test_B() {
        let data = [1,2,3,4]
        let head = ListNode.deserialize(data)
        
        let result = DeleteTheMiddleNodeOfALinkedList().deleteMiddle(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,2,4])
    }
    
    @Test
    func test_C() {
        let data = [2,1]
        let head = ListNode.deserialize(data)
        
        let result = DeleteTheMiddleNodeOfALinkedList().deleteMiddle(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [2])
    }
}
