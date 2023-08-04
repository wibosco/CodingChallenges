//
//  BinaryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by William Boles on 22/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal/
struct BinaryTreeLevelOrderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) worst/average (O(1) for best)
    //binary tree
    //iterative
    //BFS
    //
    //Solution Description:
    //Using BFS we traverse the tree level by level and add each node that we encounter to `levels`.
    static func levelOrder(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = [root]
        var levels = [[Int]]()
        
        while !queue.isEmpty {
            var level = [Int]()
            var newQueue = [BinaryTreeNode]()
            
            for node in queue {//need to know how many times we remove from the queue for this level
                level.append(node.val)
                
                if let left = node.left {
                    newQueue.append(left)
                }
                
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            
            queue = newQueue
            levels.append(level)
        }
        
        return levels
    }
}
