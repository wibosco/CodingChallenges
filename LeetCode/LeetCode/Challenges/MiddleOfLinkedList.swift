//
//  MiddleOfLinkedList.swift
//  CodingChallenges
//
//  Created by William Boles on 28/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/middle-of-the-linked-list/
//linked list
struct MiddleOfLinkedList {
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //Using a slow and fast pointer we iterate through the list. The slow pointer moves one node at a time whereas the fast
    //pointer moves two nodes. This result in the slow pointer pointing at the middle of the list 
    static func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
    
    //Time: O(n) where `n` is the number of nodes in the list
    //Space: O(n) where `n` is the number of nodes in the list
    //array
    //
    //Solution Description:
    //Iterate through the array, placing all nodes into an array in the order we encounter them in. Once list has been
    //fully traversed we divide the length of the array by 2 (as this is an int division any reminder is lost) and
    //return the element at that index
    static func middleNodeArray(_ head: ListNode?) -> ListNode? {
        var array = [ListNode]()
        
        var curr: ListNode? = head
        while curr != nil {
            array.append(curr!)
            curr = curr?.next
        }
        
        let mid = (array.count / 2)
        
        return array[mid]
    }
}
