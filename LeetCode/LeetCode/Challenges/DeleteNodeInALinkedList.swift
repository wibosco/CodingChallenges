// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/delete-node-in-a-linked-list/
struct DeleteNodeInALinkedList {
    
    //Time: O(1)
    //Space: O(1)
    //linked list
    //
    //Solution Description:
    //We can't delete `node` from the list as we don't have access to the previous node to `node`. Instead we can create the
    //previous node as the current node by copying the next nodes value over the the node the deleted and then deleting the
    //old next node - in effect creating a previous node.
    func deleteNode(_ node: ListNode?) {
        guard let node, let next = node.next else {
            return
        }
        
        node.val = next.val
        node.next = next.next //skip over the node that was copied so elimating it from the linked list
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //
    //Solution Description:
    //We can't delete `node` from the list as we don't have access to the previous node to `node` instead we need to move `node`
    //to the tail of the list and delete the tail. We do this by copying the value of next node to the current node. Once we
    //run out of next nodes we have reached the end and can delete that node.
    func deleteNode2(_ node: ListNode?) {
        guard let node else {
            return
        }

        var prev: ListNode?
        var current = node
        while let next = current.next {
            current.val = next.val
            
            prev = current
            current = next
        }

        prev?.next = nil
    }
}
