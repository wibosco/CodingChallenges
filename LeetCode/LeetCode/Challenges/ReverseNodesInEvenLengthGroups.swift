// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/reverse-nodes-in-even-length-groups/
struct ReverseNodesInEvenLengthGroups {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //reverse linked list
    //two pointers
    //
    //Solution Description:
    //Iterating through the linked list in incrementing group jumps, whenever we encoutner a group with an even count we reverse
    //the elements in that group and reattach it to the wider linked list
    func reverseEvenLengthGroups(_ head: ListNode?) -> ListNode? {
        var groupLength = 1
        var prev = head
        var current = head
        
        while current != nil {
            let groupHead = current
            var groupTail = current
            
            var remaining = groupLength
            var count = 0
            while current != nil, remaining > 0 {
                groupTail = current
                current = current?.next
                
                remaining -= 1
                count += 1
            }
            
            if count % 2 == 0 {
                prev?.next = reverse(groupHead, groupLength)
                
                //groupHead is now the tail
                groupHead?.next = current
                prev = groupHead
            } else {
                prev = groupTail
            }
            
            groupLength += 1
        }
        
        return head
    }
    
    private func reverse(_ head: ListNode?, _ length: Int) -> ListNode? {
        var prev: ListNode?
        var current = head
        var remaining = length
        
        while let c = current, remaining > 0 {
            let tmp = c.next
            
            c.next = prev
            prev = c
            
            current = tmp
            
            remaining -= 1
        }
        
        return prev
    }
}
