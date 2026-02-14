// Created 10/05/2025.

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/
struct RemoveDuplicatesFromAnUnsortedLinkedList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //dictionary
    //frequency
    //multi-pass
    //sentinel head
    //
    //Solution Description:
    //We iterate through the nodes in the list and populate a frequency dictionary with how many times each `val` appears. We
    //then iterate through the nodes in the list again and where that `val` has a value of 2 or more we skip over that node.
    //In order to skip the node `n` we need to track the node `n-1` which we do with `prev`. Special care needs to be given to
    //when we update `prev` - when we skip a node `prev` does not need to be changed; when we don't skip a node `prev` is set
    //to the `current` node. We make use of a sentinel head in case the first node in the list is duplicate.
    func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        var frequency = [Int: Int]()
        var current = head
        
        while let c = current {
            frequency[c.val, default: 0] += 1
            current = c.next
        }
        
        let sentinel = ListNode(0)
        sentinel.next = head
        
        var prev = sentinel
        current = head
        while let c = current {
            if (frequency[c.val] ?? 0) > 1 {
                prev.next = c.next
                //no need to update prev as the current prev is now right for the next iteration
            } else {
                prev = c
            }
            
            current = c.next
        }
        
        return sentinel.next
    }
}
