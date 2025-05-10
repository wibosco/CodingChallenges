// Created 10/05/2025.

import Testing

@testable import LeetCode

struct RemoveZeroSumConsecutiveNodesFromLinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,-3,3,1]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [3,1])
    }
    
    @Test
    func test_B() {
        let data = [1,2,3,-3,4]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,2,4])
    }
    
    @Test
    func test_C() {
        let data = [1,2,3,-3,-2]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1])
    }
    
    @Test
    func test_D() {
        let data = [1, -1]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [])
    }
    
    @Test
    func test_E() {
        let data = [1,3,2,-3,-2,5,5,-5,1]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,5,1])
    }
    
    @Test
    func test_F() {
        let data = [0,0]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [])
    }
    
    @Test
    func test_G() {
        let data = [2,2,-2,1,-1,-1]
        let head = ListNode.deserialize(data)
        
        let result = RemoveZeroSumConsecutiveNodesFromLinkedList().removeZeroSumSublists(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [2,-1])
    }
}
