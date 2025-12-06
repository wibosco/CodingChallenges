// Created 17/11/2023.

import Foundation

//https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/
struct MaximumLevelSumOfABinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the number of nodes in the widest level
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we perform a level-by-level traversal of the tree. At each level we calculate the sum of all nodes in that level
    //and then compare that local sum with the overall `maxSum`. If the local sum is larger then we replace `maxSum` with that
    //local sum and update `levelWithMaxSum` to be the current level. We repeat this for all levels in the tree.
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var maxSum = Int.min
        var levelWithMaxSum = 1
        var level = 1
        
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
            
            if maxSum < sum { //sum needs to be greater, equal isn't enough to update the level
                levelWithMaxSum = level
                maxSum = sum
            }
            
            level += 1
            queue = nextIteration
        }
        
        return levelWithMaxSum
    }
}
