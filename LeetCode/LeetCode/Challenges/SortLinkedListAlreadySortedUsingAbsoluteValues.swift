// Created 10/05/2025.

import Foundation

//https://leetcode.com/problems/sort-linked-list-already-sorted-using-absolute-values/
struct SortLinkedListAlreadySortedUsingAbsoluteValues {
    
    //Time: O(n) where n is the number of nodes on the list
    //Space: O(1)
    //linked list
    //two pointers
    //sorting
    //inline
    //
    //Solution Description:
    //We really only need to move the negative values as the positive values are already in the correct order. The negative
    //values need to be reversed to be in the correct order - we can do this by moving each negative value we encounter to
    //the front of the list i.e. replacing the head of the list with that node. As we iterate through the list we peek ahead
    //to check the next nodes value, this allows us to easily update the `next` property of the current node to skip over
    //any nagative nodes that are being moved. After iterating through all nodes we can return `head`.
    //
    //N.B. Special is taken to avoid moving the initial `head` node as doing so causes issues with a negative only list.
    func sortLinkedList(_ head: ListNode?) -> ListNode? {
        var head = head
        var current = head
        
        while let c = current {
            if let next = c.next, next.val < 0 {
                c.next = next.next
                next.next = head
                head = next
                //no need to update current as it is still going to used next iteration
            } else {
                current = c.next
            }
        }
        
        return head
    }
    
    //Time: O(n) where n is the number of nodes on the list
    //Space: O(1)
    //linked list
    //two pointers
    //sorting
    //
    //Solution Description:
    //We split the combined list into two lists: one for sorted negative value nodes, one for sorted positive value nodes.
    //When adding to the negative list we add new nodes to in front of the head of the list. When adding to the positve list
    //we add new nodes to the tail of the list. Special care must be taken to hold onto the tail of the negative list and the
    //head of the positive list as these nodes will be used to combine the two lists back into one. After all nodes in the
    //list have been sorted we comine the negative and positive list into the nagative list. As it is possible for the
    //negative list to be nil when returning the combined list we check if the negative list is nil and if it is we return
    //only the postive list; if the negative list is not nil we return the combined list.
    func sortLinkedList2(_ head: ListNode?) -> ListNode? {
        var negativeListHead: ListNode?
        var negativeListTail: ListNode?
        
        var positveListHead: ListNode?
        var positiveListTail: ListNode?
        
        var current = head
        while let c = current {
            current = c.next
            c.next = nil
            
            if c.val < 0 {
                if negativeListTail == nil {
                    negativeListTail = c
                }
                
                c.next = negativeListHead
                negativeListHead = c
            } else {
                if positveListHead == nil {
                    positveListHead = c
                    positiveListTail = c
                } else {
                    positiveListTail?.next = c
                    positiveListTail = positiveListTail?.next
                }
            }
        }
        
        negativeListTail?.next = positveListHead
        
        return negativeListHead != nil ? negativeListHead : positveListHead
    }
}
