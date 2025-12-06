// Created 29/01/2022.

import Foundation

//https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
struct BinaryTreeLevelOrderTraversalII {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree as stored in `levels`
    //binary tree
    //BFS
    //iterative
    //
    //Solution Description:
    //Using BFS we traverse through the tree level-by-level, adding the value of each node we encounter an array for that level.
    //After iterating through each node at level we add the `level` array to the front of the `levels` array. Finally after
    //iterating through the full tree we turn the `levels` array.
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }

        var queue = [root]
        var levels = [[Int]]()
        
        while !queue.isEmpty {
            var level = [Int]()
            var newQueueItems = [TreeNode]()
            
            for node in queue {
                level.append(node.val)
                
                if let left = node.left {
                    newQueueItems.append(left)
                }
                
                if let right = node.right {
                    newQueueItems.append(right)
                }
            }
            
            levels.insert(level, at: 0)
            queue = newQueueItems
        }
        
        return levels
    }
}
