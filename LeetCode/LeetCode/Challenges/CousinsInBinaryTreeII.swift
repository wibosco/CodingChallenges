//
//  CousinsInBinaryTreeII.swift
//  LeetCode
//
//  Created by William Boles on 16/11/2023.
//

import Foundation

//https://leetcode.com/problems/cousins-in-binary-tree-ii/
struct CousinsInBinaryTreeII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n)
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //A twist on a standard BFS we check track of the current iteration of nodes to be procssed in the queue and also the previous
    //iteration of nodes. The current iteration of nodes allows us to easily calculate the sum of nodes at that level while the
    //previous iteration allows us to subtract from that level sum, the value of nodes that share same a parent. The difference
    //between these two sums is then assigned to each child node of that parent.
    static func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var parentQueue = [TreeNode]()
        
        root.val = 0 //we know the root has no cousins
        
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
            
            //update the value of nodes minus the sum of a parents childern
            for parent in parentQueue {
                let childSum = (parent.left?.val ?? 0) + (parent.right?.val ?? 0)
                parent.left?.val = sum - childSum
                parent.right?.val = sum - childSum
            }
            
            //current iteration now becomes the parents next time
            parentQueue = queue
            queue = nextIteration
        }
        
        return root
    }
}
