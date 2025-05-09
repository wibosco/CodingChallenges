// Created 09/05/2025.

import Testing

@testable import LeetCode

struct DeleteNodeInALinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [4,5,1,9]
        let head = ListNode.deserialize(data)
        var node = head
        while let n = node {
            if n.val == 5 {
                break
            }
            
            node = n.next
        }
        
        DeleteNodeInALinkedList().deleteNode(node)
        let values = ListNode.serialize(head)
        
        #expect(values == [4,1,9])
    }
    
    @Test
    func test_B() {
        let data = [4,5,1,9]
        let head = ListNode.deserialize(data)
        var node = head
        while let n = node {
            if n.val == 1 {
                break
            }
            
            node = n.next
        }
        
        DeleteNodeInALinkedList().deleteNode(node)
        let values = ListNode.serialize(head)
        
        #expect(values == [4,5,9])
    }
}
