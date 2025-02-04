//
//  FindNearestRightNodeInBinaryTree.swift
//  LeetCode
//
//  Created by William Boles on 24/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-nearest-right-node-in-binary-tree/
struct FindNearestRightNodeInBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree.
    //Space: O(n) largest level could contain n nodes
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level. Each node we check against `u` once we have a match we set `foundU` to
    //true so that the next node we encounter in that level we return it, if we don't encounter another node we know that
    //there is no to the right of `u` and can return nil. If we get to the end of the tree traversal and haven't found `u` we
    //return nil.
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let root = root, let u = u else {
            return nil
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            var foundU = false //reset every level
            
            for node in queue {
                if foundU {
                    return node
                } else if node.val == u.val {
                    foundU = true
                } else {
                    if let left = node.left {
                        nextIteration.append(left)
                    }
                    
                    if let right = node.right {
                        nextIteration.append(right)
                    }
                }
            }
            
            if foundU {
                return nil
            }
            
            queue = nextIteration
        }
        
        return nil
    }
}
