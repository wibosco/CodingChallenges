// Created 10/02/2026.

import Foundation

//https://leetcode.com/problems/number-of-recent-calls/
    
//Time: O(n) where n is the number of calls to `ping(_:)`
//Space: O(n)
//linked list
//sentinel head
//
//Solution Description:
//Using a linked list we can store `t` values seen so far as nodes. Whenever a new `t` value is added we iterate through the
//list and remove those nodes that are below the `t - 3000` threshold. We also maintain a `count` proeprty, that is
//incremented and decremented as required.
class RecentCounter {
    private class ListNode {
        let t: Int
        var next: ListNode?
        var prev: ListNode?

        init(_ t: Int) {
            self.t = t
        }
    }

    private let head = ListNode(-1)
    private var tail = ListNode(-1)

    private var count = 0

    init() {
        self.tail.prev = self.head
        self.head.next = self.tail
    }
    
    func ping(_ t: Int) -> Int {
        count += 1

        let node = ListNode(t)

        tail.prev?.next = node
        node.prev = tail.prev
        tail.prev = node
        node.next = tail

        while let next = head.next, next.t != -1 && next.t < t - 3000 {
            head.next = head.next?.next
            head.next?.prev = head

            count -= 1
        }

        return count
    }
}
