// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/insertion-sort-list/
struct InsertionSortList {
    
    //Time: O(n ^ 2) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //sorting
    //sentinel head
    //fast forward
    //
    //Solution Description:
    //Effectively we have two lists - one sorted, one unsorted. We iterate through the nodes in the unsorted list and transplant
    //each node into the its correct position in the sorted list. To determine where in the sorted list the unsorted node
    //should go we fast forward the sorted list nodes starting at the head of that list. Once the transplant has occurred we
    //move onto the next node in the unsorted list and repeat the process. Once all nodes have been sorted we return the head of
    //the sorted list.
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let sortedListSentinel: ListNode? = ListNode(0)
        var unsortedListCurrent = head

        while let unsortedListC = unsortedListCurrent {
            var sortedListPrev = sortedListSentinel
            
            //this fast forward happens on the sorted list
            while let p = sortedListPrev?.next, p.val <= unsortedListC.val {
                sortedListPrev = sortedListPrev?.next
            }
            
            let unsortedListNext = unsortedListC.next
            
            //transplant the node into the sorted list
            unsortedListC.next = sortedListPrev?.next
            sortedListPrev?.next = unsortedListC
            
            //move the unsorted list forward
            unsortedListCurrent = unsortedListNext
        }

        return sortedListSentinel?.next
    }
    
    //Time: O(n ^ 2) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //sorting
    //sentinel head
    //
    //Solution Description:
    //We iterate through the list checking the current node against the previous nodes value to determine if the current node
    //is the correct position. If the current node is greater than the previous node, we move the current node into it's
    //right position by iterating the list from the start until we find that position. We then move `current` onto the next
    //unprocessed node and repeat the process. Once all nodes have been processed we return the sort list.
    func insertionSortList2(_ head: ListNode?) -> ListNode? {
        let sentinel: ListNode? = ListNode(0) //using a sentinel head so we always have a reference to the start of the list
        sentinel?.next = head

        var prev = head
        var current = head?.next

        while let c = current, let p = prev {
            if p.val > c.val {
                p.next = c.next

                insert(sentinel, c)

                current = p.next
            } else {
                prev = c
                current = c.next
            }
        }

        return sentinel?.next
    }
    
    private func insert(_ head: ListNode?, _ node: ListNode) {
        var prev = head
        var current = head?.next
        
        while let c = current {
            guard node.val > c.val else {
                prev?.next = node
                node.next = c
                
                return
            }

            prev = c
            current = c.next
        }
    }
}
