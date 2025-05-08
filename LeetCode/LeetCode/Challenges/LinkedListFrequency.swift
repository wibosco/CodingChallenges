// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/linked-list-frequency/
struct LinkedListFrequency {
    
    //Time: O(n) where n is the number of elements in the list
    //Space: O(n)
    //linked list
    //sentinel
    //frequency
    //dictionary
    //
    //Solution Description:
    //Iterating through the linked list we track how often a value appears by building up a frequency dictionary. Once all
    //elements have been counted we then iterate through the frquency dictionary and create a new linked list with the count
    //as the node value. This list is returned.
    func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
        var frequency = [Int: Int]()

        var head = head
        while let h = head {
            frequency[h.val, default: 0] += 1

            head = h.next
        }

        let sentinel = ListNode(0)
        var tail = sentinel
        for (_, value) in frequency {
            let node = ListNode(value)
            
            tail.next = node
            tail = node
        }

        return sentinel.next
    }
}
