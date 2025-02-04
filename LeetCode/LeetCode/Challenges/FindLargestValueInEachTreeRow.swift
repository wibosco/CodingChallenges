//
//  FindLargestValueInEachTreeRow.swift
//  LeetCode
//
//  Created by William Boles on 15/11/2023.
//

import Foundation

//https://leetcode.com/problems/find-largest-value-in-each-tree-row/
struct FindLargestValueInEachTreeRow {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the number of nodes at the widest level
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we can go level-by-level and find the largest value for the nodes at that level. At the end of each level we can
    //then store that largest value in `values`. Once all nodes have been checked we return `values.`
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }
        
        var values = [Int]()
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var maxValue = queue[0].val
            var nextIteration = [TreeNode]()
                
            for node in queue {
                maxValue = max(maxValue, node.val)
                
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
            }
            
            values.append(maxValue)
            queue = nextIteration
        }
        
        return values
    }
}
