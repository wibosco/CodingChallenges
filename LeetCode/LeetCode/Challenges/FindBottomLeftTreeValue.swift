//
//  FindBottomLeftTreeValue.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-bottom-left-tree-value/
struct FindBottomLeftTreeValue {
    
    //Time: O(n) where n is the number of nodes in tree
    //Space: O(m) where m is the number of nodes at the widest level
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Reading a level left-to-right, the bottom left-most node is the first node at the deepest level. So by traversing the tree in
    //a BFS level-by-level fashion where we add a nodes left child before it's right child, the first node popped from the queue at
    //each level will the left most node of that level so each level we go down we can assign that first node to `bottomLeftMost`.
    //Once we traverse all levels we can return `bottomLeftMost`.
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        var bottomLeftMost = root.val
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            bottomLeftMost = queue[0].val
            var nextIteration = [TreeNode]()
            
            for node in queue {
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
            }
            
            queue = nextIteration
        }
        
        return bottomLeftMost
    }
}
