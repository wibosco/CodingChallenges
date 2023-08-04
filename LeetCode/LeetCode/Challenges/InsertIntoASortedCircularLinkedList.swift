//
//  InsertIntoASortedCircularLinkedList.swift
//  LeetCode
//
//  Created by William Boles on 20/04/2022.
//

import Foundation

//https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/
struct InsertIntoASortedCircularLinkedList {
    
    //Time: O(n)
    //Space: O(1)
    //linked list
    //two pointers
    //
    //Solution Description:
    //Iterating through the list we attempt find the position that the new node (`insertVal`) should be inserted. Using two
    //pointers we move through the list comparing `insertVal` against both the current node (`t`) and the next node (`n`) in the
    //list. If `insertVal` is between those two nodes values then we insert the new node there. Special care needs to be taken
    //when we reach the "end" of the ascending values as it is possible for `insertVal` to actuall be the smallest or largest
    //value in the list so it won't actually fall between any two nodes and should be added at the end (or start). Another
    //special case is where having iterated through the list we still haven't found a "spot" for the new node - this can occur
    //when the list contains duplicate node values, in this case we need to insert the new node before the `head` node.
    static func insert(_ head: ListNode?, _ insertVal: Int) -> ListNode? {
        guard let head = head else {
            let node = ListNode(insertVal)
            node.next = node
            return node
        }
        
        var tail: ListNode? = head
        
        while let t = tail {
            guard t.next !== t else {
                //list only contains one node
                let node = ListNode(insertVal)
                t.next = node
                node.next = t
                
                break
            }
            
            let n = t.next!
            
            if t.val < n.val { //ascending value
                if insertVal >= t.val && insertVal <= n.val {
                    //new node between is between t and n
                    let node = ListNode(insertVal)
                    let tmp = t.next
                    t.next = node
                    node.next = tmp
                    
                    break
                }
            } else if t.val > n.val { //descending value i.e. start of the list
                if insertVal >= t.val || insertVal <= n.val {
                    //new node is either less than all other nodes or greater than all other nodes
                    let node = ListNode(insertVal)
                    let tmp = t.next
                    t.next = node
                    node.next = tmp
                    
                    break
                }
            } else if n == head {//back to the start, list contains duplicates
                let node = ListNode(insertVal)
                let tmp = t.next
                t.next = node
                node.next = tmp
                
                break
            }
            
            tail = t.next
        }
        
        return head
    }
}
