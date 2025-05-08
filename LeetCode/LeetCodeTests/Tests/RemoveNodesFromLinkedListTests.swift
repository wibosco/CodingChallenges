// Created 08/05/2025.

import Testing

@testable import LeetCode

struct RemoveNodesFromLinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [5,2,13,3,8]
        let head = ListNode.deserialize(data)
        
        let result = RemoveNodesFromLinkedList().removeNodes(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [13,8])
    }
    
    @Test
    func test_B() {
        let data = [1,1,1,1]
        let head = ListNode.deserialize(data)
        
        let result = RemoveNodesFromLinkedList().removeNodes(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,1,1,1])
    }
}
