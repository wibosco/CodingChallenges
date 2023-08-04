//
//  PopulatingNextRightPointersII.swift
//  LeetCode
//
//  Created by William Boles on 26/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
struct PopulatingNextRightPointersII {
    
    //Time: O(
    //Space: O(1)
    //binary tree - not perfect
    //BFS
    //linked list
    //
    //Solution Description:
    //1. BFS traversal
    //2. Treat each level as a linked list
    //3. Set N + 1 `next` property from level N
    //4. Loop to find `next` that has children
    static func connectList(_ root: BinaryTreeNodeNext?) -> BinaryTreeNodeNext? {
        guard let root = root else {
            return nil
        }

        root.left?.next = root.right
        var leftMostNode = root.left ?? root.right //what if this doesn't exist?
        
        while leftMostNode != nil { //move down the levels
            var head = leftMostNode
            
            while head != nil { //move across the level
                var nextHead = head?.next //find next head that has at least one child
                while nextHead != nil {
                    if nextHead?.left != nil || nextHead?.right != nil {
                        break
                    }
                    nextHead = nextHead?.next
                }
                
                head?.left?.next = head?.right ?? (nextHead?.left ?? nextHead?.right)
                //don't need to concerned here about double assigning either nexthead
                //node as any nexthead node is only assigned if right was nil so
                //turning this into a no-op
                head?.right?.next = nextHead?.left ?? nextHead?.right
                
                head = head?.next
            }
            
            var nextLeftMostNode = leftMostNode //find next node to be leftmost - it isn[t neccesaary the next left node
            while nextLeftMostNode != nil {
                if nextLeftMostNode?.left != nil || nextLeftMostNode?.right != nil {
                    break
                }
                nextLeftMostNode = nextLeftMostNode?.next
            }
            
            leftMostNode = nextLeftMostNode?.left ?? nextLeftMostNode?.right
        }
        
        return root
    }
    
    //Time: O(n)
    //Space: O(n)
    //binary tree - not perfect
    //BFS
    //queue - use queue count as level count
    //pointer
    //
    //Solution Description:
    //1. BFS traversal
    //2. Queue nodes
    //3. Use a `prev` to set the N - 1 nodes next property to the N node
    static func connect(_ root: BinaryTreeNodeNext?) -> BinaryTreeNodeNext? {
        guard let root = root else {
            return nil
        }
        
        var queue = [root]
        
        while !queue.isEmpty {
            let count = queue.count //how many nodes are in this level
            var prev: BinaryTreeNodeNext?
            
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
