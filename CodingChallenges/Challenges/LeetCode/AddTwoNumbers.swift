//
//  AddTwoNumbers.swift
//  CodingChallenges
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/add-two-numbers/
//linked list
class AddTwoNumbers {
    
    //Time: O(n) where `n` is the list of greater between `l1` and `l2`
    //Space: O(n)
    //math
    //
    //Solution Description:
    //Rather than treat each list as containing one number, adding it to the other lists number and then splitting
    //the sum of that addition into nodes in a new list - which could result in an overflow if either the original
    //numbers contained in the list are too large or the sum is too large. We instead treat the lists as what they
    //are - a collection of numbers and we add that collection together individually - being careful to ensure that
    //any carry from those additions is also applied. This removes the possibility of overflow occuring during the
    //addition. We make use of a dummy node `placeholderHead` to ensure that even as the new list progresses we
    //never lose the head of that list.
    //
    //N.B. see also https://leetcode.com/problems/add-strings/
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        
        var prev = ListNode(0)
        let placeholderHead = prev
        
        var carry = 0
        
        while l1 != nil || l2 != nil || carry > 0 {
            let firstValue = l1?.val ?? 0
            let secondValue = l2?.val ?? 0
            
            let sum = firstValue + secondValue + carry
            
            let value = sum % 10
            carry = sum / 10
            
            let node = ListNode(value)
            prev.next = node
            prev = node
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return placeholderHead.next
    }
}
