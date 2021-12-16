//
//  ReverseLinkedList.swift
//  CodingChallenges
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/reverse-linked-list/
//linked list
struct ReverseLinkedList {
    
    //Time: O(n) where `n` is the number of nodes in the list.
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //Iterate through swapping nodes around so that for a list of: [1 -> 2 -> 3 -> 4 -> 5], the step are
    //[2 -> 3 -> 4 -> 5] [1]
    //[3 -> 4 -> 5] [2 -> 1]
    //[4 -> 5] [3 -> 2 -> 1]
    //[5] [4 -> 3 -> 2 -> 1]
    //[5 -> 4 -> 3 -> 2 -> 1]
    //As you can see as we swap nodes, we are effectively more them from one list to another
    static func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var prev: ListNode? = nil
        var cur: ListNode? = head
        
        while cur != nil { //Time: O(n/2)
            let tmp = cur?.next
            
            cur?.next = prev
            prev = cur
            cur = tmp
        }
        
        return prev
    }
    
    //Time: O(n) where `n` is the number of nodes in the list.
    //Space: O(n) call stack
    //recursive
    //
    //Solution Description:
    //Recusively iterate through the list, shrinking the list by one with each call until we get to the tail (base case) i.e.
    //node with no `next`. We return the tail back up the call stack. With each return we take the head at thay level and
    //reverse the pointer relationship with its next node i.e. from `head -> next` to `next -> head` (remembering to set the
    //next of head to nil to avoid introducing a cycle). We continue this until all nodes in the list have been swapped.
    static func reverseListRecusive(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        guard let next = head.next else { // base case
            return head
        }
        
        let reversedHead = reverseList(next)
        next.next = head // reverse the pointer so that next now points at head
        head.next = nil // now that next points at head, we don't want head pointing at next as this would be a cycle
        
        return reversedHead // this is the same node that is passed through all the recursive calls - it's the new head/former tail from the base case
    }
    
    //Time: O(n) where `n` is the number of nodes in the list.
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //Iterate through the list until we find the tail. Once we have the tail start to move the nodes one at
    //time from the front of the list to be directly behind the old tail.
    static func reverseListConstantSpace(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var tail = head
        
        while let next = tail.next {
            tail = next
        }
        
        var left = head
        
        while tail != left {
            let tailDetacted = tail.next
            tail.next = left
            left = left.next!
            tail.next?.next = tailDetacted
        }
        
        return tail
    }
    
    //Time: O(n) where `n` is the number of nodes in the list.
    //Space: O(n) where `n` is the number of nodes in the list.
    //
    //Solution Description:
    //Iterate througgh the list placing each array in order into an array. Once we have all nodes in the array
    //iterate through the array in reverse order in pairs, swapping the order of the pair around and reattaching
    //the swap nodes with the surrounding nodes.
    static func reverseListArray(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var list = [head]
        var curr: ListNode? = head.next
        while let c = curr {
            list.append(c)
            curr = c.next
        }
        
        for i in (0..<(list.count - 1)).reversed() {
            let next = list[i]
            let head = list[(i + 1)]
            
            let tmp = head.next
            head.next = next
            next.next = tmp
        }
        
        return list.last
    }
}
