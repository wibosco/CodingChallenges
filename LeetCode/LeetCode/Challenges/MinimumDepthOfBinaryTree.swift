//
//  MinimumDepthOfBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 10/07/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-depth-of-binary-tree/
struct MinimumDepthOfBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //BFS
    //queue
    //iterative
    //level-by-level
    //
    //Solution Description:
    //Using BFS we traverse down the tree in a level-by-level fashion - tracking the level change as we do with `depth`.
    //We do this until we find a leaf node (no left or right child) at which point we return the current depth.
    //
    //Tree height vs depth:
    //
    //The depth of a node is the number of edges from the node to the tree's root node - a root node will have a depth of 0.
    //
    //The height of a node is the number of edges on the longest path from the node to a leaf - a leaf node will have a
    //height of 0.
    //
    //Example:
    //
    //                         +-------+
    //                         | d = 0 |
    //                  +------+       +------+
    //                  |      | h = 2 |      |
    //                  |      +-------+      |
    //                  |                     |
    //                  v                     v
    //              +-------+             +-------+
    //              | d = 1 |             | d = 1 |
    //       +------+       |             |       |
    //       |      | h = 1 |             | h = 0 |
    //       |      +-------+             +-------+
    //       |
    //       v
    //   +-------+
    //   | d = 2 |
    //   |       |
    //   | h = 0 |
    //   +-------+
    //
    static func minDepth(_ root: BinaryTreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var depth = 0
        var queue = [root]
        
        while !queue.isEmpty {
            depth += 1
            var newQueue = [BinaryTreeNode]()
            
            for node in queue {
                guard node.left != nil || node.right != nil else { //check if leaf node
                    return depth
                }
                
                if let left = node.left {
                    newQueue.append(left)
                }
                
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            
            queue = newQueue
        }
        
        return -1
    }
}
