// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/remove-nodes-from-linked-list/
struct RemoveNodesFromLinkedList {
    
    //Time: O(n) where n is the number of elements in the list
    //Space: O(n)
    //linked list
    //stack
    //array
    //
    //Solution Description:
    //We iterate through the list and add each node to a stack. We then pop each node from the stack and compare it against the
    //largest node seen so far (which is the head of the new list), if that node is larger we set that larger node to be the
    //head of the new list with it's `next` node being the old head. We repeat this process until the stack is empty and we can
    //return `newHead`.
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var stack = [ListNode]()
        
        var current = head
        
        while let c = current {
            stack.append(c)
            current = c.next
        }
        
        var newHead = stack.removeLast() //nothing can be larger than the last element so set that as the head
        
        while let node = stack.popLast() {
            if node.val >= newHead.val {
                node.next = newHead
                newHead = node
            }
        }
        
        return newHead
    }
    
    //Time: O(n) where n is the number of elements in the list
    //Space: O(1)
    //linked list
    //two pointers
    //reverse linked list
    //
    //Solution Description:
    //First we reverse the linked list to allow us to compare the current node against it's next node. If that next node
    //is smaller we skip over it by setting `next` on the current node to the be the next-next node; if that next node is
    //larger then we set it as the comparison node. We repeat this process for all nodes. Once smaller nodes have been
    //filtered out we reverse the list to get the correct ordering and return the new head.
    func removeNodes2(_ head: ListNode?) -> ListNode? {
        let reversedHead = reverse(head)
        
        var tail = reversedHead //nothing can be larger than reversedHead so set that as the tail
        while let n1 = tail, let n2 = n1.next {
            if n1.val > n2.val {
                n1.next = n2.next
            } else {
                tail = n2
            }
        }
        
        return reverse(reversedHead)
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head
        
        while let c = current {
            let tmpNext = c.next
            
            c.next = prev
            prev = c
            
            current = tmpNext
        }
        
        return prev
    }
}
