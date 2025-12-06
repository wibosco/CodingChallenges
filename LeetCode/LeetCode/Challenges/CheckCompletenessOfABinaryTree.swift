// Created 18/11/2023.

import Foundation

//https://leetcode.com/problems/check-completeness-of-a-binary-tree/
struct CheckCompletenessOfABinaryTree {
    
    //Time: O(
    //Space: O(
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Performing BFS we are able to inspect all nodes in a level together from left-to-right, this allows us to "spot" any gaps.
    //If a gap is spotted we set `missing` to true and then if we ever encountered a node again we know this isn't a complete
    //tree - it's important to note that the next node might be on the same level or the next level so `missing` needs to exist
    //outside of queue and not be reset with each level. If we traverse all levels we know there are either no gaps or the gaps
    //to the right of the last node (which is acceptable) then we return true.
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var missing = false
                
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            
            for node in queue {
                if let left = node.left {
                    if missing {
                        return false
                    }
                    
                    nextIteration.append(left)
                } else {
                    missing = true
                }
                
                if let right = node.right {
                    if missing {
                        return false
                    }
                    
                    nextIteration.append(right)
                } else {
                    missing = true
                }
            }
            
            queue = nextIteration
        }
        
        return true
    }
}
