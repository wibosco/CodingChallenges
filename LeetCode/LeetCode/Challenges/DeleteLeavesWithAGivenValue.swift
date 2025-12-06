// Created 15/11/2023.

import Foundation

//https://leetcode.com/problems/delete-leaves-with-a-given-value/
struct DeleteLeavesWithAGivenValue {
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //bottom-up
    //
    //Solution Description:
    //Using DFS we traverse to the leaf nodes of each branch and then pass back if the parent node should delete that child. This
    //ensures that if a parent node becomes a leaf node and it's value matches `target` it will also be deleted.
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        if dfs(root, target) {
            return nil
        }
        
        return root
    }
    
    private func dfs(_ node: TreeNode?, _ target: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        let canDeleteLeft = dfs(node.left, target)
        let canDeleteRight = dfs(node.right, target)
        
        if canDeleteLeft {
            node.left = nil
        }
        
        if canDeleteRight {
            node.right = nil
        }
        
        return canDeleteLeft && canDeleteRight && target == node.val
    }
}
