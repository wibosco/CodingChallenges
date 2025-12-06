// Created 20/04/2022.

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
    //pointers we move through the list comparing `insertVal` against both the current node (`current`) and the next node
    //(`next`) in the list. If `insertVal` is between those two nodes values then we insert the new node there. Special care
    //needs to be taken when we reach the "end" of the ascending values as it is possible for `insertVal` to actually be the
    //smallest or largest value in the list so it won't actually fall between any two nodes and should be added at the end
    //(or start). Another special case is where having iterated through the list we still haven't found a "spot" for the new
    //node - this can occur when the list contains duplicate node values, in this case we need to insert the new node before
    //the `head` node.
    func insert(_ head: ListNode?, _ insertVal: Int) -> ListNode? {
        guard let head = head else {
            let node = ListNode(insertVal)
            node.next = node
            
            return node
        }
        
        guard head !== head.next else {
            //list only contains one node
            let node = ListNode(insertVal)
            head.next = node
            node.next = head
            
            return head
        }
    
        var current = head
        
        while true {
            let next = current.next!
            
            if current.val < next.val { //ascending value
                if insertVal >= current.val && insertVal <= next.val {
                    //new node between is between current and next
                    let node = ListNode(insertVal)
                    let tmp = current.next
                    current.next = node
                    node.next = tmp
                    
                    break
                }
            } else if current.val > next.val { //descending value i.e. start of the list
                if insertVal >= current.val || insertVal <= next.val {
                    //new node is either less than all other nodes or greater than all other nodes
                    let node = ListNode(insertVal)
                    let tmp = current.next
                    current.next = node
                    node.next = tmp
                    
                    break
                }
            } else if next === head {//back to the start, list contains duplicates
                let node = ListNode(insertVal)
                let tmp = current.next
                current.next = node
                node.next = tmp
                
                break
            }
            
            current = current.next!
        }
        
        return head
    }
}
