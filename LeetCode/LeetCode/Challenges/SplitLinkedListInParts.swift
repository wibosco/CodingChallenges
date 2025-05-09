// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/split-linked-list-in-parts/
struct SplitLinkedListInParts {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //fast forward
    //modulo
    //
    //Solution Description:
    //Iterating through the linked list we count how many nodes are in the list. Then we use that total to calculate the size
    //of each list - this happens in two parts: first we calculate the ideal size of each list and then we calculate how many
    //left over nodes there are. As we can only have a deviation in the size of nodes in each lists of 1, these left over
    //nodes will be disturbed among the other lists one by one. To handle the situation where there are more lists than nodes,
    //`lists` is defaulted to `k` elements. We then iterate over the list again, transplanting the head of each new list into
    //`lists` and fast forwarding through the nodes to the tail of the new list. Once we hae the tail it must be split from
    //it's `next` node as the next node is in a different list. We repeat this process for the rest of the nodes in the list
    //and return `lists`.
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var total = 0
        var current = head
        
        while current != nil {
            current = current?.next
            total += 1
        }
        
        let listSize = max(1, total/k) //if k is greater than total we default to 1
        var abnormalSizedLists = k > total ? 0 : total % k
        var bucket = 0
        var lists: [ListNode?] = Array(repeating: nil, count: k)
        current = head
        while current != nil {
            lists[bucket] = current
            
            var remaining = (listSize - 1) //-1 to stop on the tail node of this group
            if abnormalSizedLists > 0 {
                remaining += 1 //add one additional nodef to this list to ensure all nodes are in a bucket
                abnormalSizedLists -= 1
            }
            
            //fast forward to tail of new list
            while current != nil && remaining > 0 {
                current = current?.next
                remaining -= 1
            }
            
            let tmp = current?.next
            current?.next = nil
            current = tmp
            
            
            bucket += 1
        }
        
        return lists
    }
}
