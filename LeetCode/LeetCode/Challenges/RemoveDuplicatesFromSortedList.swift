// Created 16/03/2022.

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list/
struct RemoveDuplicatesFromSortedList {
    
    //Time: O(n) where n is the number of elements in the list
    //Space: O(1)
    //linked list
    //two pointers
    //fast forward
    //
    //Solution Description:
    //We iterate through the list, comparing one node against it `next` neighbor - these nodes are known as `tail` and `next`. If they
    //are duplicates i.e. have the same value, we "fast forward" through that duplicate node or nodes until we either reach a
    //non-duplicate node or reach the end of the list; if they are not duplicate we don't fast forward. Regardless of where we end up
    //we assign the `next` neighbor of `tail` to whatever node `next` is currently and move `tail` onto that node. Once all nodes have
    //been processed we return `head` as that will have never been removed.
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var tail: ListNode? = head
        
        while tail != nil {
            var next = tail?.next
            while next != nil, next?.val == tail?.val {
                next = next?.next
            }
            
            tail?.next = next
            tail = tail?.next
        }
        
        return head
    }
    
    //Time: O(n) where n is the number of elements in the list
    //Space: O(1)
    //linked list
    //two pointers
    //
    //Solution Description:
    //Using two pointers iterate through the list looking for duplicates. `p1` is ahead of `p0` so when comparing `p0` with `p1` if
    //we encounter the same `val` for two nodes we "pause" `p0` at the start of the duplicates and move `p1` forward until we find a
    //non-duplicate node. We then by-pass the duplicate nodes from `p0` to `p1` by reassigning the `next` node on `p0` to point at
    //`p1`. To protect against duplicates at the end of the list we always set the `next` node on `p0` to nil.
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        var p0 = head
        var p1 = head?.next
        
        while p1 != nil {
            if p0?.val != p1?.val {
                p0?.next = p1
                p0 = p0?.next
            }
            
            p1 = p1?.next
        }
        
        p0?.next = nil
        
        return head
    }
}
