// Created 28/01/2022.

import Foundation

//https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
struct BinaryTreeZigzagLevelOrderTraversal {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(n) where n is the number of nodes in the tree (`levels` array)
    //binary tree
    //BFS
    //queue
    //level traversal
    //array
    //
    //Solution Description:
    //Using BFS we traverse the tree level by level, adding the value of each node at the current level to a `level` array
    //and its children to `newQueueItems`. At the end of each level we check `leftToRight` and if the ordering is meant to
    //be right-to-left we reverse `level` before adding it to `levels`; if the ordering is left-to-right we just add `level`
    //without reversing. We then toggle `leftToRight` and repeat the process with `newQueueItems` as our new `queue`. At the
    //end of our traversal, `levels` contains the values of all the nodes in the tree in zigzag order.
    //
    //N.B. Replacing `queue` with `newQueueItems` rather than calling `removeFirst()` on `queue` avoids shifting every
    //remaining element along each time a node is dequeued.
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return [[Int]]()
        }
        
        var levels = [[Int]]()
        var queue = [root]
        var leftToRight = true
        
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
            
            queue = newQueueItems
            
            if !leftToRight {
                level.reverse()
            }
            
            levels.append(level)
            leftToRight.toggle()
        }
        
        return levels
    }
}
