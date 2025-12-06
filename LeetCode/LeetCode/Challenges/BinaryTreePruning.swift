// Created 16/11/2023.

import Foundation

//https://leetcode.com/problems/binary-tree-pruning/
struct BinaryTreePruning {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes and then return whether or not that leaf node has a value of `1` - rather than
    //returning a bool here we return either the node itself or nil so that the outcome of this recursive call can be
    //immediately assign to the child property of its parent. As the callstack unwinds we repeat this process for not just
    //the node value but also each child subtree.
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        root.left = pruneTree(root.left)
        root.right = pruneTree(root.right)
        
        return root.left != nil || root.right != nil || root.val == 1 ? root : nil
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes and then return whether or not that leaf node has a value of `1`. As the callstack
    //unwinds we repeat this process for not just the node value but also each child subtree. If a child subtree does not
    //contain at least 1 `1` we prune it.
    func pruneTreeDifferentMethod(_ root: TreeNode?) -> TreeNode? {
        if !containsOne(root) {
            return nil
        }
        
        return root
    }
    
    private func containsOne(_ node: TreeNode?) -> Bool {
        guard let node = node else {
            return false
        }
        
        let left = containsOne(node.left)
        let right = containsOne(node.right)
        
        if !left {
            node.left = nil
        }
        
        if !right {
            node.right = nil
        }
        
        return left || right || node.val == 1
    }
}
