// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/delete-n-nodes-after-m-nodes-of-a-linked-list/
struct DeleteNNodesAfterMNodesOfALinkedList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //fast forward
    //two pointers
    //
    //Solution Description:
    //Using two pointers and two counters we iterate through the nodes in the list. Inside an outer loop, we have two fast forward
    //loops - the first loop skips over all "good" nodes that should not be deleted and ends up the final "good", the second loop
    //then fast forwards over all "bad" nodes that need to be deleted until we reach another "good" node. Once both fast forwards
    //have been completed we set the `next` value on the first "good" node to be the next "good" node. We repeat this process
    //until we have deleted all "bad" nodes.
    func deleteNodes(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var tail = head
        
        while tail != nil {
            var dm = m
            var dn = n
            
            while tail != nil, dm > 1 { //1 not 0, as we want to end up on the last "good" node
                tail = tail?.next
                dm -= 1
            }
            
            var next = tail?.next
            while next != nil, dn > 0 { //0 as we want to end up on the next "good" node
                next = next?.next
                dn -= 1
            }
            
            tail?.next = next
            tail = tail?.next
        }
        
        return head
    }
}
