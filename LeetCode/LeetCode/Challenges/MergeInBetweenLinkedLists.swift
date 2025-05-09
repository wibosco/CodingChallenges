// Created 09/05/2025.

import Foundation

//https://leetcode.com/problems/merge-in-between-linked-lists/
struct MergeInBetweenLinkedLists {
    
    //Time: O(n + m) where n is the number of nodes in `list1`
    //               where m is the number of nodes in `list2`
    //Space: O(1)
    //linked list
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //When deleting and inserting nodes into a list we are interested in two positions - the node that comes before the insertion
    //and the node that comes after the insertion. First we find these two positions. As we are using a sentinel incase the head
    //of `list1` is the be removed we need to adjust `b` by adding two to get to the node beyond the nodes to be deleted. With
    //these two position now track we need to find the tail of `list2`, which we do by iterating through its nodes. Next we
    //update `preA` next property to head of `list2`, and update the tail of `list2` to point to `postB`. All that is left to
    //do is to return the new head.
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        let sentinel = ListNode(-1)
        sentinel.next = list1
        
        var preA: ListNode? = sentinel
        var postB: ListNode? = sentinel
        
        for i in 0..<(b + 2) {
            if i == a {
                preA = postB
            }
            postB = postB?.next
        }
        
        var tail = list2
        while tail?.next != nil {
            tail = tail?.next
        }
        
        preA?.next = list2
        tail?.next = postB
        
        return sentinel.next
    }
        
    //Time: O(n + m) where n is the number of nodes in `list1`
    //               where m is the number of nodes in `list2`
    //Space: O(1)
    //linked list
    //two pointers
    //sentinel head
    //
    //Solution Description:
    //When deleting and inserting nodes into a list we are interested in two positions - the node that comes before the insertion
    //and the node that comes after the insertion. As we iterated through `list1` we check for these postions. As we are using a
    //sentinel incase the head of `list1` is the be removed we need to adjust `b` by adding two to get to the node beyond the
    //nodes to be deleted. When we find the node that comes before `a` we set its next property to be the head of `list2`. When
    //we find the node that comes after `b` we set it as as the next property of `list2`. All that is left to do is to return
    //the new head.
    func mergeInBetween2(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        let sentinel = ListNode(-1)
        sentinel.next = list1

        var current: ListNode? = sentinel
        for i in 0..<(b + 2) {
            if i == a {
                let tmp = current?.next
                current?.next = list2
                current = tmp
            } else if i == (b + 2) {
                var tail = list2
                while tail?.next != nil {
                    tail = tail?.next
                }
                tail?.next = current?.next
            } else {
                current = current?.next
            }
        }

        return sentinel.next
    }
}
