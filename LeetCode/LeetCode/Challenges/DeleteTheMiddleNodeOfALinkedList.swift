// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/
struct DeleteTheMiddleNodeOfALinkedList {
        
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //two pointers
    //fast and slow pointers
    //sentinel head
    //
    //Solution Description:
    //Using fast and slow pointers we iterate through the linked list. When the `fast` pointer reaches the end of the linked list
    //the `slow` will be at the node before the middle node, allowing that middle node to be skipped over. Using a sentinel node
    //allows for the `head` node to be the one that is deleted.
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        let sentinel = ListNode(0)
        sentinel.next = head
        
        var slow: ListNode? = sentinel
        var fast = head?.next
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        slow?.next = slow?.next?.next
        
        return sentinel.next
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //array
    //
    //Solution Description:
    //We iterate through the linked list and add each node to an array. We then calculcate the mid index of that array and
    //update the next property on `mid - 1` index node to point to the `mid + 1` node or nil if it does not exist.
    func deleteMiddle2(_ head: ListNode?) -> ListNode? {
        var nodes = [ListNode]()
        var current = head
        
        while let c = current {
            nodes.append(c)
            current = c.next
        }
        
        guard nodes.count > 1 else {
            return nil
        }
        
        let mid = nodes.count / 2
        nodes[(mid - 1)].next = nodes[mid].next
        
        return head
    }
}
