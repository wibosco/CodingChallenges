// Created 21/11/2021.

import Foundation

//https://leetcode.com/problems/reorder-list/
struct ReorderList {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //reverse linked list
    //middle linked list
    //fast and slow pointers
    //two pointers
    //
    //Solution Description:
    //First we find the middle of the list and effectively split the list into two lists. Everything from the middle to end
    //is then reversed by getting the prev node and setting it as the `next` node of the current node. These two lists are
    //then merged together with each step taking the reversed list's node and making it the `next` node of the non-reversed
    //list. As we don't use an additional data structure to hold the list we need before re-assigning `next` we need to hold
    //onto the old `next` and attach it to the new `next` so we don't lose anything.
    //
    //Similar to: https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/
    //Similar to: https://leetcode.com/problems/reverse-linked-list/
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        
        //find middle node
        while fast?.next != nil { //Time: O(n)
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        //reverse
        var prev: ListNode?
        var cur = slow
        
        while cur != nil { //Time: O(n/2)
            let temp = cur?.next
            
            cur?.next = prev
            prev = cur
            cur = temp
        }
        
        var l1 = head
        var l2 = prev
        
        //merge
        while l2?.next != nil { //Time: O(n/2)
            let temp1 = l1?.next
            l1?.next = l2
            l1 = temp1
            
            let temp2 = l2?.next
            l2?.next = l1
            l2 = temp2
        }
        //remember that the final node of l1 will already be associated
        //with the final node of l2 due the original associated in the
        //unreversed list
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(1)
    //linked list
    //reverse linked list
    //middle linked list
    //fast and slow pointers
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //First we find the middle of the list and split the list into two lists. Everything from the middle to end is then
    //reversed by moving every node after `tail` to be the next node of the sentinel head in the order we are found. Once
    //`l2`is reversed we can then step through both lists and merge them. This involves the placing a node from `l2`
    //between two nodes from `l2`. Care must be taken to ensure that the old relationships of what is next are broken and
    //the new ones built. Once inserted, both lists move onto their next nodes to be merged.
    //
    //Similar to: https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/
    //Similar to: https://leetcode.com/problems/reverse-linked-list/
    func reorderList2(_ head: ListNode?) {
        let l1 = head
        var l2 = split(head)
        l2 = reverse(l2)
        merge(l1, l2)
    }

    private func split(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next // using .next so that slow is at the end of l1 when the overall end is found

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let l2 = slow?.next
        slow?.next = nil

        return l2
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        let sen = ListNode()
        sen.next = head

        var tail = head

        while tail?.next != nil {
            let nh = tail?.next
            let oh = sen.next

            sen.next = nh
            tail?.next = nh?.next
            nh?.next = oh
        }

        return sen.next
    }

    private func merge(_ l1: ListNode?, _ l2: ListNode?) {
        var l1 = l1
        var l2 = l2

        while l1 != nil, l2 != nil {
            let tmp1 = l1?.next
            let tmp2 = l2?.next

            l1?.next = l2
            l2?.next = tmp1

            l1 = tmp1
            l2 = tmp2
        }
    }
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //two pointers
    //array
    //
    //Solution Description:
    //Using an array to store all nodes in order we use two pointers to move through the array from opposite sides, overriding
    //the left nodes `next` property to now point at the right node
    func reorderList3(_ head: ListNode?) {
        var nodes = [ListNode]()
        var node: ListNode? = head
        
        while let n = node {
            nodes.append(n)
            node = n.next
        }
        
        var left = 0
        var right = nodes.count - 1
        
        while left < right {
            let leftNode = nodes[left]
            let rightNode = nodes[right]
            
            let temp = leftNode.next
            leftNode.next = rightNode
            rightNode.next = temp
            
            left += 1
            right -= 1
        }
        
        nodes[left].next = nil
    }
}
