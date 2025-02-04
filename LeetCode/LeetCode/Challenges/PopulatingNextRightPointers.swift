//
//  PopulatingNextRightPointers.swift
//  LeetCode
//
//  Created by William Boles on 25/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
struct PopulatingNextRightPointers {
    
    //Time: O(n)
    //Space: O(1)
    //binary tree - perfect
    //BFS
    //linked list - treat each level as a linked list
    //
    //Solution Description:
    //1. BFS traversal
    //2. Treat each level as a linked list
    //3. Set N + 1 `next` property from level N
    func connect(_ root: TreeNodeNext?) -> TreeNodeNext? {
        guard let root = root else {
            return nil
        }
        
        root.left?.next = root.right //connect up roots child
        var leftMostNode = root.left //`leftMostNode` will enable us to move down the tree level by level
        
        while leftMostNode != nil {
            var head = leftMostNode //`head` will enable us to move across this level
            
            while head != nil {
                //use the fact that the current level (`head`) is
                //already connected via `next` to connect the n+1 (next)
                //level (`left` and `right`)
                head?.left?.next = head?.right
                head?.right?.next = head?.next?.left
                
                head = head?.next //move onto next node on same level
            }
            
            leftMostNode = leftMostNode?.left //move onto next level
        }
        
        return root
    }
    
    //Time: O(n)
    //Space: O(n) where n is number of nodes at the last level (as it's a perfect tree)
    //binary tree - perfect
    //BFS
    //queue - use queue count as level count
    //pointer
    //
    //Solution Description:
    //1. BFS traversal
    //2. Queue nodes
    //3. Use a `prev` to set the N - 1 nodes next property to the N node
    func connectQueue(_ root: TreeNodeNext?) -> TreeNodeNext? {
        guard let root = root else {
            return nil
        }
        
        var queue = [root]
        
        while !queue.isEmpty {
            let count = queue.count //how many nodes are in this level
            var prev: TreeNodeNext?
            
            for _ in 0..<count { //need to know how many times we remove from the queue for this level
                let node = queue.removeFirst() //O(n)
                
                if let left = node.left {
                    queue.append(left)
                    prev?.next = left
                    prev = left
                }
                
                if let right = node.right {
                    queue.append(right)
                    prev?.next = right
                    prev = right
                }
            }
        }
        
        return root
    }
}
