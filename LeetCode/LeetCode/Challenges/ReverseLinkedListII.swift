//
//  ReverseLinkedListII.swift
//  LeetCode
//
//  Created by William Boles on 22/03/2022.
//

import Foundation

//https://leetcode.com/problems/reverse-linked-list-ii/
struct ReverseLinkedListII {
    
    //Time: O(n + k) where n is number of nodes in the list
    //               where k is the difference between left and right
    //Space: O(1)
    //linked list
    //multiple pointers
    //
    //Solution Description:
    //Treating the linked list as 3 lists - before left, between left and right and after right. We can then take the `between
    //left and right` and reverse the elements in position. After this we then rejoin the three lists together and return the
    //new head.
    static func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var list1Head: ListNode?
        var list1Tail: ListNode?
        
        var list2Head: ListNode?
        var list2Tail: ListNode?
        
        var list3Head: ListNode?
        var list3Tail: ListNode?
        
        var i = 1
        var current = head
        
        while let c = current {
            if i < left {
                if list1Head == nil {
                    list1Head = c
                    list1Tail = c
                } else {
                    list1Tail?.next = c
                    list1Tail = c
                }
            } else if i > right {
                if list3Head == nil {
                    list3Head = c
                    list3Tail = c
                } else {
                    list3Tail?.next = c
                    list3Tail = c
                }
            } else {
                if list2Head == nil {
                    list2Head = c
                    list2Tail = c
                } else {
                    list2Tail?.next = c
                    list2Tail = c
                }
            }
            
            i += 1
            current = c.next
        }
        
        list2Tail?.next = nil
        
        current = list2Head
        var prev: ListNode?
        
        while let c = current {
            let tmpNext = c.next
            c.next = prev
            
            prev = c
            current = tmpNext
        }
        
        if let list1Head = list1Head {
            list1Tail?.next = prev
            list2Head?.next = list3Head
            
            return list1Head
        } else {
            list2Head?.next = list3Head
            
            return prev
        }
    }
    
    //Time: O(n + k) where n is number of nodes in the list
    //               where k is the difference between left and right
    //Space: O(k)
    //linked list
    //array
    //two pointers
    //
    //Solution Description:
    //First we iterate through the list and place any nodes found between `left` and `right` (inclusive) into an array -
    //`nodes`. Then using two pointers we move through `nodes` from opposite sides and swap over the values of nodes at
    //`p0` and `p1` (note that we don't attempt to rewire the nodes `next` properties - we only swap over the values).
    //Once `p0` and `p1` cross we exit and return the head of the swapped linked list.
    static func reverseBetweenArray(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left != right else {
            return head
        }
        
        var nodes = [ListNode]()
        
        var i = 1
        var current = head
        
        while current != nil && i <= right {
            if i >= left {
                nodes.append(current!)
            }
            
            current = current!.next
            i += 1
        }
        
        var p0 = 0
        var p1 = nodes.count - 1
        
        while p0 < p1 {
            let leftNode = nodes[p0]
            let rightNode = nodes[p1]
            
            let tmp = leftNode.val
            
            leftNode.val = rightNode.val
            rightNode.val = tmp
            
            p0 += 1
            p1 -= 1
        }
        
        return left == 1 ? nodes[0] : head
    }
    
    //Time: O(n) where n is number of nodes in the list
    //Space: O(n) - recursion stack
    //linked list
    //array
    //two pointers
    //recursive
    //
    //Solution Description:
    //Using recursion we iterate through the list until we find the nodes at both `left` and `right`. As the nodes don't
    //have a `previous` pointer we instead use unravel the recursive stack to move back through the nodes from the right
    //- the current left node we update through this unravelling by using `inout` parameter so that it can updated through
    //the recursive calls. As the recursive callbacks will go all the way back to the start of the list (which could be
    //before `left`) once the swapping is complete we set `finished` to true and quick exit any recursive callbacks
    //received after this
    static func reverseBetweenRecursion(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left != right else {
            return head
        }
        
        guard let head = head else {
            return head
        }
        
        var leftNode = head
        var finished = false
        
        reverseByBacktracking(left, right, &leftNode, head, &finished)
        
        return head
    }
    
    private static func reverseByBacktracking(_ leftRemainingCount: Int, _ rightRemainingCount: Int, _ leftNode: inout ListNode, _ rightNode: ListNode?, _ finished: inout Bool) {
        guard let rightNode = rightNode, rightRemainingCount > 0 else {
            return //found `right` index node now begin backtracking
        }
        
        let nextRight = rightNode.next
        leftNode = leftRemainingCount > 1 ? leftNode.next! : leftNode //left will be found before right
        
        reverseByBacktracking((leftRemainingCount - 1), (rightRemainingCount - 1), &leftNode, nextRight, &finished)
        
        guard finished == false else { //avoid processing any callbacks after `left`
            return
        }
        
        guard leftNode !== rightNode, leftNode !== rightNode.next else {
            finished = true
            return //reversal finished as the two pointers are crossing
        }
        
        let tmp = leftNode.val
        leftNode.val = rightNode.val
        rightNode.val = tmp
        
        // move left pointer one step to the right
        // the right pointer moves one step back via backtracking.
        leftNode = leftNode.next!
    }
}
