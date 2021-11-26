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
    
    //Time: O(n)
    //Space: O(n)
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
