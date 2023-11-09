//
//  MaximumTwinSumOfALinkedList.swift
//  LeetCode
//
//  Created by William Boles on 03/08/2023.
//

import Foundation

//https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list/
struct MaximumTwinSumOfALinkedList {
    
    //Time: O(n) where n is the number of nodes in the linked list
    //Space: O(n)
    //linked list
    //array
    //
    //Solution Description:
    //With first iterate through the linked list and store the value of each node in an array. We then iterate through that
    //array and using the formula `count - 1 - i`, extract the paired node for each `i` node, calculate the sum and check it
    //against `maxSum`, taking the larger of the values as the maximum sum seen so far. Once all nodes have been paired we
    //return `maxSum`.
    static func pairSum(_ head: ListNode?) -> Int {
        var nodes = [Int]()
        
        var current = head
        
        while let c = current {
            nodes.append(c.val)
            
            current = c.next
        }
        
        var maxSum = 0
        
        for i in 0..<(nodes.count / 2) { //we know this list has an even number of nodes
            let sum = nodes[i] + nodes[(nodes.count - 1 - i)]
            maxSum = max(maxSum, sum)
        }
        
        return maxSum
    }
    
    //Time: O(n) where n is the number of nodes in the linked list
    //Space: O(1)
    //linked list
    //fast and slow
    //two pointers
    //
    //Solution Description:
    //In order to pair up nodes we need to reach the end of this linked list to know which node does with which. As this is
    //a single linked list we can't reach the end and then iterate backwards through the list instead if we treat this linked
    //list two linked lists which are split in half, we can reverse one linked list and then iterate forwards through both
    //with each node encounter on one linked list being the pair of other node on the other linked list at the same "index".
    //We can then calculate the sum of the paired nodes and check it against `maxSum`, taking the larger of the values as the
    //maximum sum seen so far. Once all nodes have been paired we return `maxSum`.
    static func pairSumReversing(_ head: ListNode?) -> Int {
        var slow = head
        var fast = head
        
        repeat {
            slow = slow?.next
            fast = fast?.next?.next
        } while fast != nil //note that we move to the "right side" of an even count middle
            
        var prev: ListNode?
        var current = head
        
        while current !== slow {
            let tmpNext = current?.next
            
            current?.next = prev
            prev = current
            
            current = tmpNext
        }
        
        var p1 = prev
        var p2 = slow
        
        var maxSum = 0
        
        while p1 != nil && p2 != nil {
            let sum = p1!.val + p2!.val
            
            maxSum = max(maxSum, sum)
            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        return maxSum
    }
}
