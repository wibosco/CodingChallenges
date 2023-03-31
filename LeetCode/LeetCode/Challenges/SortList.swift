//
//  SortList.swift
//  LeetCode
//
//  Created by William Boles on 29/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/sort-list/
//linked list
struct SortList {
    
    //Time: O(n log n) where `n` is the number of ndoes in the list
    //Space: O(1)
    //sorted
    //recursion
    //three pointers
    //fast and slow pointers
    //merge sort
    //divide and conquer
    //sentinel head
    //
    //Solution Description:
    //We can use merge sort to sort this linked list. First we need to find the middle node in the linked list which we can
    //do using a fast and slow pointer approach (the fast pointer moves at double speed compared to the slow pointer), having
    //found that middle node we then split the list around it by removing it as the next node to the node at `middle - 1`.
    //With these two lists we then attempt to recursively sort them. If the list only has one node then return it as we can't
    //get a smaller list than 1; else we split the smaller list around its middle node. After splitting/dividing we should have
    //two lists at each recursive level which then compare against each other and move each node into its sorted position. As we
    //sort the lists at each recursive level we eventually sort the full list and can return it
    //
    //See: https://leetcode.com/problems/merge-two-sorted-lists/ for merging
    //See: https://leetcode.com/problems/middle-of-the-linked-list/ for finding the center of a linked list
    static func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { //basecase
            return head
        }
        
        let mid = splitListAroundMid(head)
        
        let left = sortList(head)
        let right = sortList(mid)
        
        let sortedList = merge(left, right)
        
        return sortedList
    }
    
    private static func splitListAroundMid(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? //we want to split around the middle node so we need to keep reference to the node before it
        var slow = head
        var fast = head
        
        while fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        prev?.next = nil //split the list so that `slow` is the head of a new list
        
        return slow
    }
    
    private static func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let sentinel = ListNode(-1) //so we don't lose the start of the merged list
        var mergedList = sentinel //will be the tail of the list
        
        var list1 = list1
        var list2 = list2
        
        while let l1 = list1, let l2 = list2 {
            if l1.val < l2.val {
                mergedList.next = l1
                
                list1 = l1.next
            } else {
                mergedList.next = l2
                
                list2 = l2.next
            }
            
            mergedList = mergedList.next! //will always exist as we just set in the above if statement
        }
        
        mergedList.next = (list1 == nil) ? list2 : list1
        
        return sentinel.next
    }
    
    //Time: O(n log n) where `n` is the number of nodes in the list
    //Space: O(n) where `n` is the number of nodes in the list
    //sorted
    //array
    //
    //Solution Description:
    //Go through the list and store each node into an array. Sort that array by the `val` property of each node. Link each
    //node with the node directly succeeding it so the new order is represented in the list strucutre
    static func sortListArray(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var elements = [ListNode]()
        
        var node: ListNode? = head
        while let n = node {
            elements.append(n)
            node = n.next
        }
        
        elements.sort { $0.val < $1.val }
        
        for i in 0..<(elements.count - 1) {
            let n1 = elements[i]
            let n2 = elements[(i + 1)]
            
            n1.next = n2
            n2.next = nil
        }
        
        return elements.first
    }
}
