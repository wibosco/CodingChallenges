//
//  BinaryTreeLevelOrderTraversalII.swift
//  LeetCode
//
//  Created by William Boles on 29/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
//binary tree
struct BinaryTreeLevelOrderTraversalII {
    
    //Time: O(n) where `n` is the number of nodes in the tree
    //Space: O(n) where `n` is the number of nodes in the tree as stored in `levels`
    //BFS
    //iterative
    //
    //Solution Description:
    //Using BFS we traverse through the tree level-by-level, adding the value of each node we encounter an array for that level. After iterating through
    //each node at level we add the `level` array to the front of the `levels` array. Finally after iterating through the full tree we turn the `levels`
    //array
    static func levelOrderBottom(_ root: BinaryTreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }

        var queue = [root]
        var levels = [[Int]]()
        
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            levels.insert(level, at: 0)
        }
        
        return levels
    }
}
