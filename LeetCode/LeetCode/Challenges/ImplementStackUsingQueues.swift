//
//  ImplementStackUsingQueues.swift
//  LeetCode
//
//  Created by William Boles on 05/05/2022.
//

import Foundation

//https://leetcode.com/problems/implement-stack-using-queues/
//design
//queue
//stack
final class ImplementStackUsingQueues {
    private var queue = [Int]()
    private var last: Int? //Time: O(1) for accessing the last element in stack
    
    // MARK: - Operations
    
    func push(_ x: Int) {
        queue.append(x)
        
        last = x
    }
    
    //Time: O(n) where n is the number of elements in `queue`
    //
    //Using two queues when popping we move all elements in `queue` to `transferQueue` apart from the last element in the queue
    //which we return. We then assign `transferQueue` to `queue` so we can repeat the process
    func pop() -> Int {
        var transferQueue = [Int]()
        last = nil
        while queue.count > 1 { //we only want to transfer the elements that won't be popped
            let val = queue.removeFirst() //queue so we remove the first element
            
            transferQueue.append(val)
            last = val
        }
        
        let val = queue.removeFirst()
        
        queue = transferQueue
        
        return val
    }
    
    func top() -> Int? {
        return last
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}
