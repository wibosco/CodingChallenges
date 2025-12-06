// Created 15/11/2023.

import Foundation

//https://leetcode.com/problems/reverse-odd-levels-of-binary-tree/
struct ReverseOddLevelsOfBinaryTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the number of nodes in the widest level of the tree
    //binary tree
    //BFS
    //iterative
    //level traversal
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level. At each level we check if that level is odd, if it is we swap the current node's
    //value with its mirrored node's value - note how we don't swap the actual nodes just their values, this saves us having to
    //re-associate any child nodes. We repeat this process for all nodes in the tree.
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        var level = 0
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            
            for i in 0..<queue.count {
                let node = queue[i]
                
                if let left = node.left {
                    nextIteration.append(left)
                }
                
                if let right = node.right {
                    nextIteration.append(right)
                }
                
                if level % 2 == 1 && i < (queue.count / 2) { //odd
                    let mirrored = queue[((queue.count - 1) - i)]
                        
                    let tmp = node.val //don't want to lose this value when we override to mirrored.val
                    node.val = mirrored.val
                    mirrored.val = tmp
                }
            }
            
            level += 1
            queue = nextIteration
        }
        
        return root
    }
}
