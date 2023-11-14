//
//  DeepestLeavesSum.swift
//  LeetCode
//
//  Created by William Boles on 10/11/2023.
//

import Foundation

//https://leetcode.com/problems/deepest-leaves-sum/
struct DeepestLeavesSum {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) is the maximum number of nodes at any given level
    //binary tree
    //BFS
    //level traversal
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level and calculate the sum of all the nodes at that level, this level sum is then
    //store outside the BFS loop in `lastSum`. Using `lastSum` means tjaty we don't need any special loop to know when we are on the
    //final level as each level will override `lastSum` so when the queue is empty `lastSum` will be the last sum.
    static func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var lastSum = 0
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            
            var sum = 0
            
            for node in queue {
                sum += node.val
                
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
            }
            
            lastSum = sum
            queue = nextIteration
        }
        
        return lastSum
    }
}
