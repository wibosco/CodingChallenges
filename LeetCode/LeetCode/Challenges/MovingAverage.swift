// Created 28/02/2022.

import Foundation

//https://leetcode.com/problems/moving-average-from-data-stream/
//design
//
//Time: O(1) where n is the window size
//Space: O(n)
//linked list
final class MovingAverage {
    private class ListNode {
        let val: Int
        var next: ListNode?
        var prev: ListNode?

        init(_ val: Int) {
            self.val = val
        }
    }

    private let size: Int
    private let head: ListNode
    private let tail: ListNode
    
    private var totalSum = 0
    private var nodeCount = 0

    init(_ size: Int) {
        self.size = size
        self.head = ListNode(-1)
        self.tail = ListNode(-1)

        head.next = tail
        tail.prev = head
    }
    
    func next(_ val: Int) -> Double {
        let node = ListNode(val)
        
        tail.prev?.next = node
        node.next = tail
        tail.prev = node

        nodeCount += 1
        totalSum += val

        if nodeCount > size {
            let valToBeRemoved = head.next?.val ?? 0
            totalSum -= valToBeRemoved

            nodeCount -= 1

            head.next = head.next?.next
            head.next?.prev = head
        }

        return Double(totalSum) / Double(nodeCount)
    }
}


//https://leetcode.com/problems/moving-average-from-data-stream/
//design
//
//Time: O(n) where n is the window size
//Space: O(n)
//array
final class MovingAverage2 {
    private let size: Int
    private var store = [Int]()
    private var total = 0

    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        store.append(val)
        total += val

        if store.count > size {
            total -= store.removeFirst()
        }

        return Double(total)/Double(store.count)
    }
}
