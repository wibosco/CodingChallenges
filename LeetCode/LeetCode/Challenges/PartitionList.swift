// Created 18/03/2022.

import Foundation

//https://leetcode.com/problems/partition-list/
struct PartitionList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1) we merely reassign the existing nodes
    //linked list
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //Set up to lists: `lessThanList` to store the less than `x` nodes and `greaterThanList` to store the greater than or equal to
    //`x` nodes. Iterate through the list and assign each node we encounter to either list. Once we have iterated through the
    //original list we break any cycle that may have been introduced between `lessThanList` and `greaterThanList` by assigning the
    //tail of `greaterThanList` to point at nil. We then combine the two lists and using the dummy node for `lessThanList` return
    //the head of `lessThanList`.
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lessThanList: ListNode? = ListNode(-1)
        let sentinelLess = lessThanList //needed to hold onto the head of lessThanList
        
        var greaterThanList: ListNode? = ListNode(-1)
        let sentinelGreater = greaterThanList //needed to hold onto the head of greaterThanList
        
        var current = head
        
        while let c = current {
            if x > c.val {
                lessThanList?.next = c
                lessThanList = lessThanList?.next
            } else {
                greaterThanList?.next = c
                greaterThanList = greaterThanList?.next
            }
            
            current = c.next
        }
        
        greaterThanList?.next = nil //break any cycle between lessThanList and greaterThanList
        lessThanList?.next = sentinelGreater?.next
        
        return sentinelLess?.next
    }
}
