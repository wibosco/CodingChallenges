// Created 04/08/2023.

import Foundation

//https://leetcode.com/problems/swapping-nodes-in-a-linked-list/
struct SwappingNodesInALinkedList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //three pointers
    //trailing pointer
    //
    //Solution Description:
    //Using three pointers we can iterate through the linked list and find the nodes that should be swapped in one pass. The
    //`left` pointer will find the `k`th node in from the start, the `trailing` node will find the `k`th node in from the
    //end, and the `right` pointer will find the end of the list. Knowing that the second node to be swapped will be `k`
    //nodes from the end but not knowing how many nodes are in the list we can use a trailing/offset pointer that only starts
    //to move after we already seen `k` nodes - this will result in the `trailing` pointer being `k` nodes in from the end of
    //the list. We then exchange their `val` values - note that there is not need to actually move the node itself just the
    //value it represents.
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var left = head
        var trailing = head
        var right = head
        
        var count = 0
        
        while let r = right {
            if count < (k - 1) {
                left = left?.next
            } else if count >= k {
                trailing = trailing?.next
            }
            
            count += 1
            
            right = r.next
        }
        
        if let left = left, let trailing = trailing {
            let tmpVal = left.val
            left.val = trailing.val
            trailing.val = tmpVal
        }
        
        return head
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //
    //Solution Description:
    //We iterate through the linked list twice. The first time to determine the size of the linked list and the second time
    //to capture the nodes that will be swapped using that count to help determine which node is the second/right node. We
    //then exchange their `val` values - note that there is not need to actually move the node itself just the value it
    //represents.
    func swapNodesCount(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 0
        
        var current = head
        
        while let c = current {
            count += 1
            
            current = c.next
        }
        
        var first: ListNode?
        var second: ListNode?
        
        current = head
        
        var i = 0
        
        while let c = current {
            if i == (k - 1) {
                first = c
            } else if i == (count - k) {
                second = c
            }
            
            current = c.next
                
            i += 1
        }
        
        if let first = first, let second = second {
            let tmpVal = first.val
            first.val = second.val
            second.val = tmpVal
        }
        
        return head
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //array
    //
    //Solution Description:
    //We move through the linked list and store each node that we encounter into an array. We then take the two we are interested
    //in swapping and exchange their `val` values - note that there is not need to actually move the node itself just the value it
    //represents.
    func swapNodesArray(_ head: ListNode?, _ k: Int) -> ListNode? {
        var array = [ListNode]()
        
        var current = head
        
        while let c = current {
            array.append(c)
            
            current = c.next
        }
        
        let first = array[(k - 1)]
        let second = array[(array.count - k)]

        let tmpVal = first.val
        first.val = second.val
        second.val = tmpVal
        
        return head
    }
}
