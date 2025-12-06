// Created 15/11/2023.

import Foundation

//https://leetcode.com/problems/add-one-row-to-tree/
struct AddOneRowToTree {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(m) where m is the widest level of the tree
    //binary tree
    //DFS
    //level traversal
    //
    //Solution Description:
    //Using BFS we traverse the tree level-by-level until we get to the `depth - 1` level i.e. the parents of the nodes to be added,
    //and then insert new nodes into that level by transplanting the existing left and right nodes as the child of the new nodes and
    //then setting the left and right child of the parent node to those new nodes.
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        guard depth > 1 else {
            let newRoot = TreeNode(val)
            newRoot.left = root
            
            return newRoot
        }
        
        var currentDepth = 2
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            var nextIteration = [TreeNode]()
            
            for node in queue {
                if currentDepth == depth {
                    let newLeftNode = TreeNode(val)
                    let newRightNode = TreeNode(val)
                    
                    newLeftNode.left = node.left
                    newRightNode.right = node.right
                    
                    node.left = newLeftNode
                    node.right = newRightNode
                } else {
                    if let left = node.left {
                        nextIteration.append(left)
                    }
                    
                    if let right = node.right {
                        nextIteration.append(right)
                    }
                }
            }
            
            guard currentDepth < depth else {
                break
            }
            
            currentDepth += 1
            queue = nextIteration
        }
        
        return root
    }
}
