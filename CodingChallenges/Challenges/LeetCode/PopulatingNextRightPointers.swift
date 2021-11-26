//
//  PopulatingNextRightPointers.swift
//  CodingChallenges
//
//  Created by William Boles on 25/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
//binary tree - perfect
//bfs
struct PopulatingNextRightPointers {
    
    //Time: O(n)
    //Space: O(1)
    //linked list - treat each level as a linked list
    static func connect(_ root: TreeNodeNext?) -> TreeNodeNext? {
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
    //queue - use queue count as level count
    //pointer
    static func connectQueue(_ root: TreeNodeNext?) -> TreeNodeNext? {
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
