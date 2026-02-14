// Created 10/05/2025.

import Foundation

//https://leetcode.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
struct RemoveZeroSumConsecutiveNodesFromLinkedList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //sentinel head
    //prefix sum
    //dictionary
    //multi-pass
    //
    //Solution Description:
    //To determine which nodes can be removed we need to find where the sum of nodes from `0..n` is the same as `0..m` as this
    //shows us that the nodes between `n...m` (inclusive of `m`) can be removed (as we end up with the same value). A prefix
    //sum can be used to calculate an on-going sum all the nodes seen so far, the prefix sum of each node can then be stored in
    //a dictionary alongside the node that the sum belongs to. Using two passes, first we iterate through the list and store
    //the last time we see each prefix sum in `nodes`. We then iteerate through the list again and when we encounter the same
    //prefix sum again we set the `next` propert of the current node to the `next` peoperty of the last node to produce that
    //prefix sum, thereby removing those nodes from list. We repeat this process for all nodes in the list, after which we can
    //return the pruned down list.
    //
    //N.B. we use a sentinel head in case we encounter a prefix sum value of 0 which would mean every node up to that matching
    //node needs to be deleted  includig the existing head. Having a sentinel head allows us to hold the new head of the pruned
    //list as the next property of the sentinel.
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        let sentinel = ListNode(0)
        sentinel.next = head
        var nodes = [Int: ListNode]()
        nodes[0] = sentinel
        
        var prefixSum = 0
        var current = head
        
        //build up the prefix sum dictionary
        while let c = current {
            prefixSum += c.val
            //only interested in tracking the last instance of each prefix sum value
            nodes[prefixSum] = c
            
            current = c.next
        }
        
        prefixSum = 0
        current = sentinel
        
        //remove any duplicate prefix sum nodes
        while let c = current {
            prefixSum += c.val
            c.next = nodes[prefixSum]?.next
            
            //we've skipped over the existing nodes which have been pruned by going to the new `next` node of current
            current = c.next
        }
        
        return sentinel.next
    }
}
